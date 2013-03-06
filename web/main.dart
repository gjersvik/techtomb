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
  var wallfix = new FixtureDef();
  wallfix.density = 1;
  wallfix.restitution = 1;
  wallfix.friction = 0;
  wallfix.shape = new PolygonShape();
  wallfix.shape.setAsBox(60,5);
  
  var wallbody = new BodyDef();
  wallbody.type = BodyType.STATIC;
  wallbody.position = new Vector(50, -5);
  
  world.createBody(wallbody).createFixture(wallfix);
  wallbody.position = new Vector(50, 105);
  world.createBody(wallbody).createFixture(wallfix);
  
  wallfix.shape.setAsBox(5,60);
  wallbody.position = new Vector(-5, 50);
  world.createBody(wallbody).createFixture(wallfix);
  wallbody.position = new Vector(105, 50);
  world.createBody(wallbody).createFixture(wallfix);
  
  return world;
}

Body makeBall(world) {
  var ballfix = new FixtureDef();
  ballfix.density = 1;
  ballfix.restitution = 1;
  ballfix.friction = 0;
  ballfix.shape = new CircleShape();
  ballfix.shape.radius = 1;
  
  var ballbody = new BodyDef();
  ballbody.type = BodyType.DYNAMIC;
  ballbody.position = new Vector(50, 50);
  
  var ball = world.createBody(ballbody);
  ball.createFixture(ballfix);
  
  ball.linearVelocity = new Vector(40, 30);
  
  return ball;
}

void main() {
  var gameloop = new Loop(new TimerRunner());
  var renderloop = new Loop(new AnimationRunner());
  var paint = setupCanvas();
  var world = setupBox2d();
  var ball = makeBall(world);
  
  gameloop.callbacks.add((){
    world.step(0.016 , 10, 10);
  });
  
  renderloop.callbacks.add((){
    paint.clearRect(0, 0, 100, 100);
    
    paint.fillStyle = 'yellow';
    paint.beginPath();
    paint.arc(ball.position.x, ball.position.y, 1, 0, PI*2, false);
    
    
    paint.fill();
  });
  
  gameloop.start();
  renderloop.start();
}

