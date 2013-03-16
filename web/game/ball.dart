library ball;

import 'dart:math' as Math;
import 'package:HtmlBlock/game.dart';

class Ball extends BodyObject{
  num _size;
  num _speed;
  num _angle;

  Ball(String name, World world, {
      num x: 50,
      num y: 50,
      num size: 1,
      num speed: 60,
      num angle: 1}):
        _size = size,
        _speed = speed,
        _angle = angle,
        super(name,'ball', x:x, y:y){
    var shape = new CircleShape();
    shape.radius = _size;
    shapes.add(shape);
    createBody(world);
    _updateSpeed(_speed,_angle);
  }

  Map toGameState(){
    var state = super.toGameState();
    state['size'] = size;
    return state;
  }

  get size => _size;

  _updateSpeed(speed,angle){
    var v = new vec2();
    v.x = speed * Math.cos(angle);
    v.y = speed * Math.sin(angle);
    body.linearVelocity = v;
    _speed = speed;
    _angle = angle;
  }
}