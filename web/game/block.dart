library block;

import 'package:HtmlBlock/game.dart';

class Block extends BodyObject{
  num _height;
  num _width;

  Block(String name, World world, {
      num x: 50,
      num y: 50,
      num height: 2.4,
      num width: 4.8}):
        _height = height,
        _width = width,
        super(name,'block', x:x, y:y){
    bodydef.type = BodyType.KINEMATIC;

    var shape = new PolygonShape();
    shape.setAsBox(width/2,height/2);
    shapes.add(shape);

    createBody(world);
  }

  Map toGameState(){
    var state = super.toGameState();
    state['height'] = _height;
    state['width'] = _width;
    return state;
  }
}

