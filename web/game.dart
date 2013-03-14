library game;

import 'package:box2d/box2d.dart';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';

class Game{
  World world;
  
  Game(){
    world = new World(new vec2(0, 0), true, new DefaultWorldPool());
    
    _createWall();
    
  }
  
  _createWall(){
    var shape = new PolygonShape();
    shape.setAsBox(90,20);
    var body = new BodyDef();
    body.type = BodyType.STATIC;
    
    shape.setAsBox(70,10);
    body.position = new vec2(50, -10);
    world.createBody(body).createFixtureFromShape(shape);
    body.position = new vec2(50, 110);
    world.createBody(body).createFixtureFromShape(shape);
    
    shape.setAsBox(10,70);
    body.position = new vec2(-10, 50);
    world.createBody(body).createFixtureFromShape(shape);
    body.position = new vec2(110, 50);
    world.createBody(body).createFixtureFromShape(shape);
  }
}
