import 'ball.dart';
import 'painter.dart';

import 'dart:math' as Math;
import 'dart:html';

import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/loop/animation_runner.dart';

CanvasRenderingContext2D setupCanvas(){
  var size = Math.min(window.innerHeight,window.innerWidth);
  CanvasElement c = query('#htmlblocks');
  CanvasRenderingContext2D paint = c.getContext('2d');
  
  c.height = size;
  c.width = size;
  
  paint.scale(size / 100, size / 100);
  
  return paint;
}

World setupBox2d(){
  var world = new World(new vec2(0, 0), true, new DefaultWorldPool());
  var wall_fix = new FixtureDef();
  wall_fix.density = 1;
  wall_fix.restitution = 1;
  wall_fix.friction = 0;
  wall_fix.shape = new PolygonShape();
  wall_fix.shape.setAsBox(60,5);
  
  var wall_body = new BodyDef();
  wall_body.type = BodyType.STATIC;
  wall_body.position = new vec2(50, -5);
  
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new vec2(50, 105);
  world.createBody(wall_body).createFixture(wall_fix);
  
  wall_fix.shape.setAsBox(5,60);
  wall_body.position = new vec2(-5, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new vec2(105, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  
  return world;
}

class GameState{
  Map _state;
  
  GameState(): _state = {};
  
  addState(num gametime, Map state) => _state = state;
  getState(num gametime) => _state;
  loop(Map event) =>
    addState(event['gametime'],event['gamestate']);
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
  var game_loop = new Loop(new TimerRunner());
  var render_loop = new Loop(new AnimationRunner());
  var context = setupCanvas();
  var world = setupBox2d();
  
  var gamestate = new GameState();
  
  var balls = new Balls(world);
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  balls.genBall();
  
  game_loop.callbacks.add((_) => world.step(0.016 , 10, 10));
  
  game_loop.callbacks.add((e) => e['gamestate'] = balls.toGameState());
  
  game_loop.callbacks.add(gamestate.loop);
  
  render_loop.callbacks.add((event){
    context.clearRect(0, 0, 100, 100);
    var state = gamestate.getState(event['gametime']);
    paint(context, state);
  });
  
  game_loop.start();
  render_loop.start();
}

