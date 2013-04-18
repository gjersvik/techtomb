part of techtomb_htmlblock;

class Pad extends BodyObject{
  World _world;
  num _to = 50;
  num _topspeed;
  num _height;
  num _width;

  Pad(String name, World world, {
      num x: 50,
      num y: 95,
      num height: 2,
      num width: 10,
      num topspeed: 100}):
        _height = height,
        _width = width,
        _topspeed = topspeed,
        _world = world,
        super(name,'pad', x:x, y:y){
    bodydef.type = BodyType.KINEMATIC;

    var shape = new PolygonShape();
    shape.setAsBox(width/2-height/2,height/2);
    shapes.add(shape);

    var shape2 = new CircleShape();
    shape2.radius = height/2;
    shape2.position.x = (width - height)/2;
    shapes.add(shape2);

    var shape3 = new CircleShape();
    shape3.radius = height/2;
    shape3.position.x = (width - height)/-2;
    shapes.add(shape3);

    createBody(world);
  }

  num get to => _to;
  set to(num to) => _to = to.clamp(_width / 2, 100 - (_width / 2));

  void preStep(){
    num vx = (_to - x) * _world.timestep.inv_dt;
    vx = vx.clamp(-_topspeed, _topspeed);
    body.linearVelocity = new vec2(vx, 0);
  }

  Map toGameState(){
    var state = super.toGameState();
    state['height'] = _height;
    state['width'] = _width;
    return state;
  }
}

