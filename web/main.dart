import 'ball.dart';

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

void main() {
  var game_loop = new Loop(new TimerRunner());
  var render_loop = new Loop(new AnimationRunner());
  var paint = setupCanvas();
  var world = setupBox2d();
  var ball = new BallBody(world);
  ball.x = 50;
  ball.y = 50;
  ball.angle = 1;
  
  game_loop.callbacks.add((_){
    world.step(0.016 , 10, 10);
  });
  
  render_loop.callbacks.add((_){
    paint.clearRect(0, 0, 100, 100);
    
    paint.fillStyle = 'yellow';
    paint.beginPath();
    paint.arc(ball.x, ball.y, ball.size, 0, Math.PI*2, false);
    
    
    paint.fill();
  });
  
  game_loop.start();
  render_loop.start();
}

