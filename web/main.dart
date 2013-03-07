import 'dart:html';
import 'dart:math';

import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/loop/animation_runner.dart';

CanvasRenderingContext2D setupCanvas(){
  var size = min(window.innerHeight,window.innerWidth);
  CanvasElement c = query('#htmlblocks');
  CanvasRenderingContext2D paint = c.getContext('2d');
  
  c.height = size;
  c.width = size;
  
  paint.scale(size / 100, size / 100);
  
  return paint;
}

World setupBox2d(){
  var world = new World(new Vector(0, 0), true, new DefaultWorldPool());
  var wall_fix = new FixtureDef();
  wall_fix.density = 1;
  wall_fix.restitution = 1;
  wall_fix.friction = 0;
  wall_fix.shape = new PolygonShape();
  wall_fix.shape.setAsBox(60,5);
  
  var wall_body = new BodyDef();
  wall_body.type = BodyType.STATIC;
  wall_body.position = new Vector(50, -5);
  
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new Vector(50, 105);
  world.createBody(wall_body).createFixture(wall_fix);
  
  wall_fix.shape.setAsBox(5,60);
  wall_body.position = new Vector(-5, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  wall_body.position = new Vector(105, 50);
  world.createBody(wall_body).createFixture(wall_fix);
  
  return world;
}

Body makeBall(world) {
  var ball_fix = new FixtureDef();
  ball_fix.density = 1;
  ball_fix.restitution = 1;
  ball_fix.friction = 0;
  ball_fix.shape = new CircleShape();
  ball_fix.shape.radius = 1;
  
  var ball_body = new BodyDef();
  ball_body.type = BodyType.DYNAMIC;
  ball_body.position = new Vector(50, 50);
  
  var ball = world.createBody(ball_body);
  ball.createFixture(ball_fix);
  
  ball.linearVelocity = new Vector(40, 30);
  
  return ball;
}

void main() {
  var game_loop = new Loop(new TimerRunner());
  var render_loop = new Loop(new AnimationRunner());
  var paint = setupCanvas();
  var world = setupBox2d();
  var ball = makeBall(world);
  
  game_loop.callbacks.add((){
    world.step(0.016 , 10, 10);
  });
  
  render_loop.callbacks.add((){
    paint.clearRect(0, 0, 100, 100);
    
    paint.fillStyle = 'yellow';
    paint.beginPath();
    paint.arc(ball.position.x, ball.position.y, 1, 0, PI*2, false);
    
    
    paint.fill();
  });
  
  game_loop.start();
  render_loop.start();
}

