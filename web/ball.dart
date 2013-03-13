library ball;

import 'dart:math' as Math;
import 'package:box2d/box2d.dart';

class Ball{
  num x = 0;
  num y = 0;
  num size = 1;
  num speed = 60;
  num angle = 0;
}

class BallBody extends Ball {
  Body body;
  Fixture fixture;
  num _speed = 60;
  num _angle = 0;
  
  
  BallBody(World world){
    var ball_body = new BodyDef();
    ball_body.type = BodyType.DYNAMIC;
    ball_body.position = new vec2(0, 0);
    
    body = world.createBody(ball_body);
    
    var ball_fix = new FixtureDef();
    ball_fix.density = 1;
    ball_fix.restitution = 1;
    ball_fix.friction = 0;
    ball_fix.shape = new CircleShape();
    ball_fix.shape.radius = 1;
    
    fixture = body.createFixture(ball_fix);
    
    _updateSpeed(_speed,_angle);
  }
  
  get x => body.position.x;
  set x(x) => body.setTransform(new vec2(x,y), body.angle);
  
  get y => body.position.y;
  set y(y) => body.setTransform(new vec2(x,y), body.angle);
  
  get size => fixture.shape.radius;
  set size(size) => fixture.shape.radius = size;
  
  get speed => _speed;
  set speed(speed) => _updateSpeed(speed,_angle);
  
  get angle => _angle;
  set angle(angle) => _updateSpeed(_speed,angle);
  
  _updateSpeed(speed,angle){
    var v = new vec2();
    v.x = speed * Math.cos(angle);
    v.y = speed * Math.sin(angle);
    body.linearVelocity = v;
    _speed = speed;
    _angle = angle;
  }
}