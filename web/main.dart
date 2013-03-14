import 'ball.dart';
import 'render.dart';

import 'dart:math' as Math;

import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/loop/animation_runner.dart';

World setupBox2d(){
  var world = new World(new vec2(0, 0), true, new DefaultWorldPool());
  var wall_fix = new FixtureDef();
  wall_fix.density = 1;
  wall_fix.restitution = 1;
  wall_fix.friction = 0;
  wall_fix.shape = new PolygonShape();
  wall_fix.shape.setAsBox(60,20);
  
  var wall_body = new BodyDef();
  wall_body.type = BodyType.STATIC;
  wall_body.position = new vec2(50, -20);
  
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new vec2(50, 120);
  world.createBody(wall_body).createFixture(wall_fix);
  
  wall_fix.shape.setAsBox(20,60);
  wall_body.position = new vec2(-20, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new vec2(120, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  
  return world;
}

class Balls{
  List balls;
  World _world;
  Math.Random _rand;
  
  Balls(this._world): _rand = new Math.Random(), balls = [];
  
  void genBall(){
    var ball = new BallBody(_world);
    ball.x = _rand.nextDouble() * 100;
    ball.y = _rand.nextDouble() * 100;;
    ball.angle = (_rand.nextDouble() * Math.PI *2) - Math.PI;
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

void main() {
  var render = new Render('#htmlblocks');
  
  var game_loop = new Loop(new TimerRunner());
  var world = setupBox2d();
  
  var balls = new Balls(world);
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  
  game_loop.callbacks.add((_) => world.step(0.016 , 10, 10));
  
  game_loop.callbacks.add((e) => e['gamestate'] = balls.toGameState());
  
  game_loop.callbacks.add((Map event) => render.addState(event['gametime'],event['gamestate']));
  
  game_loop.start();
  render.start();
}

