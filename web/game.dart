library game;
import 'ball.dart';

import 'dart:math' as Math;
import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/actions.dart';

typedef void TakeState(num gametime, Map<String, dynamic> state);

class Game{
  World world;
  Loop loop;
  Actions actions;
  AnalogAction padAction;
  Pad pad;
  Ball ball;
  TakeState _takeState;

  Game():
    world = new World(new vec2(0, 0), true, new DefaultWorldPool()),
    loop = new Loop(new TimerRunner()),
    actions = new Actions(){

    padAction = actions.add(new AnalogAction('PadPosition'));
    padAction.value = 0.5;
    padAction.reset();
    _createWall();

    pad = new Pad(world);
    ball = new Ball(world,
        x: 50,
        y: 50,
        angle: 1
    );

    loop.callbacks.add(_gameloop);
  }

  start() => loop.start();

  addActions(List<Map<String, dynamic>> state) => actions.data = state;

  postState(TakeState callback) => _takeState = callback;

  _gameloop(event){
    var state = {};
    pad.moveTo(padAction.value * 100);
    world.step(0.016 , 10, 10);
    state['ball'] = ball.toGameState();
    state['pad'] = pad.toGameState();
    _takeState(event['gametime'],state);
  }

  _createWall(){
    var shape = new PolygonShape();
    shape.setAsBox(90,20);
    var body = new BodyDef();
    body.type = BodyType.STATIC;

    shape.setAsBox(70,10);
    body.position = new vec2(50, -10);
    world.createBody(body).createFixtureFromShape(shape);
    body.position = new vec2(50, 110);
    world.createBody(body).createFixtureFromShape(shape);

    shape.setAsBox(10,70);
    body.position = new vec2(-10, 50);
    world.createBody(body).createFixtureFromShape(shape);
    body.position = new vec2(110, 50);
    world.createBody(body).createFixtureFromShape(shape);
  }
}

class Pad{
  Body body;
  Fixture fixture;
  num _topspeed;
  num _height;
  num _width;

  Pad(World world, {
      num x: 50,
      num y: 95,
      num height: 2,
      num width: 10,
      num topspeed: 30}):
        _height = height,
        _width = width,
        _topspeed = topspeed {
    var bodydef = new BodyDef();
    bodydef.type = BodyType.KINEMATIC;
    bodydef.position = new vec2(x, y);

    body = world.createBody(bodydef);

    var shape = new PolygonShape();
    shape.setAsBox(width/2,height/2);

    fixture = body.createFixtureFromShape(shape);
  }

  get x => body.position.x;
  get y => body.position.y;

  moveTo(x){
    body.setTransform(new vec2(x,y), body.angle);
  }

  Map toGameState(){
    return {
      'type': 'pad',
      'x': x,
      'y': y,
      'height': _height,
      'width': _width
    };
  }
}