library ball;

import 'package:HtmlBlock/game.dart';
import 'dart:math' show PI;

class Ball extends BodyObject{
  const MIN_ANGLE = 10 * PI / 180;
  num _size;
  num _speed;
  num _angle;
  bool _recalcSpeed = false;

  Ball(String name, World world, {
      num x: 50,
      num y: 90,
      num size: 1,
      num speed: 60,
      num angle: -1}):
        _size = size,
        _speed = speed,
        _angle = angle.toDouble(),
        super(name,'ball', x:x, y:y){
    var shape = new CircleShape();
    shape.radius = _size;
    shapes.add(shape);
    createBody(world);
    _updateSpeed(_speed,_angle);
  }

  void postContact(Contact contact, Fixture other, ContactImpulse impulse){
    _recalcSpeed = true;
  }

  void postStep(){
    if(_recalcSpeed == true){
      _angle = atan(body.linearVelocity.y, body.linearVelocity.x);
      _angle = _splitt(_angle, -PI, MIN_ANGLE);
      _angle = _splitt(_angle, -PI / 2, MIN_ANGLE);
      _angle = _splitt(_angle, 0, MIN_ANGLE);
      _angle = _splitt(_angle, PI / 2, MIN_ANGLE);
      _angle = _splitt(_angle, PI, MIN_ANGLE);
      _updateSpeed(_speed,_angle);
    }
  }

  Map toGameState(){
    var state = super.toGameState();
    state['size'] = size;
    return state;
  }

  get size => _size;

  _updateSpeed(speed,angle){
    var v = new vec2();
    v.x = speed * cos(angle);
    v.y = speed * sin(angle);
    body.linearVelocity = v;
    _speed = speed;
    _angle = angle;
  }

  num _splitt(num x, num center, num pluss_minus){
    if(x >= center + pluss_minus || x <= center - pluss_minus) {
      return x;
    }
    if(x >= center) {
      return center + pluss_minus;
    }else{
      return center - pluss_minus;
    }
  }

}