library ball;

import 'dart:math' as Math;
import 'package:box2d/box2d.dart';
import 'package:gamelib/game.dart';

class Ball extends GameObject{
  Body body;
  Fixture fixture;
  num _speed;
  num _angle;


  Ball(String name, World world, {
      num x: 50,
      num y: 50,
      num size: 1,
      num speed: 60,
      num angle: 1}):
      _speed = speed,
      _angle = angle,
      super(name,'ball'){
    var ball_body = new BodyDef();
    ball_body.type = BodyType.DYNAMIC;
    ball_body.position = new vec2(x, y);

    body = world.createBody(ball_body);

    var fix = new FixtureDef();
    fix.density = 1;
    fix.restitution = 1;
    fix.friction = 0;
    fix.shape = new CircleShape();
    fix.shape.radius = size;

    fixture = body.createFixture(fix);

    _updateSpeed(_speed,_angle);
  }

  Map toGameState(){
    var state = super.toGameState();
    state['x'] = x;
    state['y'] = y;
    state['size'] = size;
    return state;
  }

  get x => body.position.x;
  get y => body.position.y;
  get size => fixture.shape.radius;

  _updateSpeed(speed,angle){
    var v = new vec2();
    v.x = speed * Math.cos(angle);
    v.y = speed * Math.sin(angle);
    body.linearVelocity = v;
    _speed = speed;
    _angle = angle;
  }
}