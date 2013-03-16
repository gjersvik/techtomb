library body_object;

import 'package:box2d/box2d.dart';
import 'package:gamelib/game.dart';

class BodyObject extends GameObject{
  Body body;
  BodyDef bodydef;
  FixtureDef fixturedef;
  List<Shape> shapes;

  BodyObject(String name, String tags, {
    x: 50,
    y: 50
  }): super(name, tags){
    bodydef = new BodyDef();
    bodydef.type = BodyType.DYNAMIC;
    bodydef.position = new vec2(x, y);

    fixturedef = new FixtureDef();
    fixturedef.density = 1;
    fixturedef.restitution = 1;
    fixturedef.friction = 0;
    fixturedef.userData = this;

    shapes = new List<Shape>();
  }

  void createBody(World world) {
    body = world.createBody(bodydef);
    shapes.forEach((shape){
      fixturedef.shape = shape;
      body.createFixture(fixturedef);
    });
  }

  get x => body.position.x;
  get y => body.position.y;

  void preStep(){}
  void postStep(){}

  bool preContact(Body other) => true;
  void postContact(Body other){}
  bool preContactObject(BodyObject other) => true;
  void postContactObject(BodyObject other){}

  Map toGameState(){
    var state = super.toGameState();
    state['x'] = x;
    state['y'] = y;
    return state;
  }
}