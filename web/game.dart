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
  AnalogAction pad;

  var _takeState;

  Game():
    world = new World(new vec2(0, 0), true, new DefaultWorldPool()),
    loop = new Loop(new TimerRunner()),
    actions = new Actions(){

    pad = actions.add(new AnalogAction('PadPosition'));
    pad.value = 0.5;
    pad.reset();
    _createWall();

    var balls = new Balls(world);
    balls.genBall();

    loop.callbacks.add((_) => world.step(0.016 , 10, 10));

    loop.callbacks.add((e) => e['gamestate'] = balls.toGameState());
    loop.callbacks.add((e){
      var map = {};
      map['type'] = 'pad';
      map['height'] = 2;
      map['width'] = 10;
      map['y'] = 95;
      map['x'] = pad.value * 100;
      e['gamestate']['pad1'] = map;
      actions.reset();
    });

    loop.callbacks.add((event) => _takeState(event['gametime'],event['gamestate']));
  }

  start() => loop.start();

  addActions(List<Map<String, dynamic>> state) => actions.data = state;

  postState(TakeState callback) => _takeState = callback;

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

class Balls{
  List balls;
  World _world;
  Math.Random _rand;

  Balls(this._world): _rand = new Math.Random(), balls = [];

  void genBall(){
    var ball = new BallBody(_world,
        x: 50,
        y: 50,
        angle: (_rand.nextDouble() * Math.PI *2) - Math.PI);
    balls.add(ball);
  }

  Map toGameState(){
    var i = 1;
    var map = {};
    balls.forEach((ball) {
      map['Ball$i'] = ball.toGameState();
      i += 1;
    });
    return map;
  }

}
