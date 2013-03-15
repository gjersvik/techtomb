library ball;

import 'package:box2d/box2d.dart';
import 'package:gamelib/game.dart';

class Pad extends GameObject{
  Body body;
  num _topspeed;
  num _height;
  num _width;

  Pad(String name, World world, {
      num x: 50,
      num y: 95,
      num height: 2,
      num width: 10,
      num topspeed: 30}):
        _height = height,
        _width = width,
        _topspeed = topspeed,
        super(name,'pad'){
    var bodydef = new BodyDef();
    bodydef.type = BodyType.KINEMATIC;
    bodydef.position = new vec2(x, y);

    body = world.createBody(bodydef);

    var shape = new PolygonShape();
    shape.setAsBox(width/2-height/2,height/2);
    body.createFixtureFromShape(shape);

    var shape2 = new CircleShape();
    shape2.radius = height/2;
    shape2.position.x = (width - height)/2;
    body.createFixtureFromShape(shape2);

    var shape3 = new CircleShape();
    shape3.radius = height/2;
    shape3.position.x = (width - height)/-2;
    body.createFixtureFromShape(shape3);
  }

  get x => body.position.x;
  get y => body.position.y;

  moveTo(x){
    body.setTransform(new vec2(x,y), body.angle);
  }

  Map toGameState(){
    var state = super.toGameState();
    state['x'] = x;
    state['y'] = y;
    state['height'] = _height;
    state['width'] = _width;
    return state;
  }
}

