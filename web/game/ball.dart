library ball;

import 'package:HtmlBlock/game.dart';

class Ball extends BodyObject{
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
}