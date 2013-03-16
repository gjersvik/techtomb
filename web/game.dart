library game;
import 'game/ball.dart';
import 'game/pad.dart';

import 'dart:math' as Math;
import 'package:box2d/box2d.dart';

import 'package:gamelib/game.dart';

typedef void TakeState(num gametime, Map<String, dynamic> state);

class Game{
  World world;
  Loop loop;
  Actions actions;
  AnalogAction padAction;
  GameObjects objects;
  Pad pad;
  TakeState _takeState;

  Game():
      world = new World(new vec2(0, 0), true, new DefaultWorldPool()),
      loop = new Loop(new TimerRunner()),
      actions = new Actions(),
      objects = new GameObjects(){
    padAction = actions.add(new AnalogAction('PadPosition'));
    padAction.value = 0.5;
    padAction.reset();
    _createWall();

    pad = objects.add(new Pad('pad', world));
    objects.add(new Ball('ball1', world));

    loop.callbacks.add(_gameloop);
  }

  start() => loop.start();

  addActions(List<Map<String, dynamic>> state) => actions.data = state;

  postState(TakeState callback) => _takeState = callback;

  _gameloop(event){
    if(padAction.triggerd){
      pad.to = padAction.value * 100;
    }

    pad.preStep();
    world.step(0.016 , 10, 10);

    _takeState(event['gametime'], objects.toGameState());
  }

  _createWall(){
    var body = new BodyDef();
    body.type = BodyType.STATIC;

    var shape = new PolygonShape();

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