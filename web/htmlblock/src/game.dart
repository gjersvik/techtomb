part of techtomb_htmlblock;

typedef void TakeState(num gametime, Map<String, dynamic> state);

class Game{
  World world;
  Loop loop;
  GameActions actions;
  Collision collision;
  NubAction padAction;
  BodyObjects objects;
  Pad pad;
  TakeState _takeState;
  num score = 0;

  num _gametime = 0;

  Game():
      world = new World(new vec2(0, 0), true, new DefaultWorldPool()),
      loop = new Loop(new TimerRunner()),
      actions = new GameActions(),
      collision = new Collision(),
      objects = new BodyObjects(){
    world.contactListener = collision;
    padAction = actions.add(new NubAction('PadPosition'));
    padAction.value = 0.5;
    padAction.reset();
    _createWall();

    pad = objects.add(new Pad('pad', world));
    objects.add(new Ball('ball1', world));
    _createBlocks();

    loop[0].listen(_gameloop);

    objects.on.listen((e){
      if(e.name == 'destroying' && e.object.type == 'block'){
        score += 1000/(_gametime/10+1);
      }
    });
  }

  start() => loop.start();

  addActions(Map<String, dynamic> state) => actions.fromMap(state);

  postState(TakeState callback) => _takeState = callback;

  _gameloop(event){
    _gametime = event['gametime'];
    if(padAction.changed){
      pad.to = padAction.value * 100;
    }

    objects.preStep();
    world.step(0.016 , 10, 10);
    objects.postStep();

    var gamestate = objects.toGameState();
    gamestate['score'] = {'type': 'score','score': score};

    _takeState(event['gametime'], gamestate);
  }

  _createWall(){
    var body = new BodyDef();
    body.type = BodyType.STATIC;

    var shape = new PolygonShape();

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

  _createBlocks() {
    var i = 0;
    var x = 0;
    var y = 0;
    while(y < 10){
      while(x < 10){
        i += 1;
        objects.add(new Block('block$i', world, x: 27.5 +(x * 5), y: 26.25 + (y * 2.5)));
        x += 1;
      }
      x = 0;
      y += 1;
    }

  }
}