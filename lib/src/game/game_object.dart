part of gamelib_game;

class GameObject extends NamedObject{
  final String type;
  EventSink<GameEvent> _sink;
  Stream<GameEvent> on;

  GameObject(name,this.type): super(name){
    var ctrl = new StreamController.broadcast();
    _sink = ctrl.sink;
    on = ctrl.stream;
  }

  Map<String, dynamic> toGameState() => {'type' :type};

  void fire(name,[data]){
    _sink.add(new GameEvent(name, this, data));
  }

  void destroy(){
    fire('destroying');
    _sink.close();
  }
}

class GameEvent{
  final String name;
  final GameObject object;
  var data = null;

  GameEvent(this.name, this.object, [this.data]);
}