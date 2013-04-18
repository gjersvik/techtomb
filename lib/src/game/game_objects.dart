part of gamelib_game;

class GameObjects<T extends GameObject> extends NamedObjects<T>{
  Stream<GameEvent> on;
  EventSink _sink;
  Map _subs;

  GameObjects():_subs = {}, super(){
    var ctrl = new StreamController();
    _sink = ctrl.sink;
    on = ctrl.stream.asBroadcastStream();
    on.listen((e){
      if(e.name == 'destroying'){
        removeObject(e.object);
      }
    });
  }

  T add(T o){
    _subs[o.name] = o.on.listen(_sink.add);
    return super.add(o);
  }
  T remove(String name){
    _subs.remove(name).cancel();
    return super.remove(name);
  }

  Map<String, Map<String,dynamic>> toGameState() {
    var state = {};
    objects.forEach((key, object) => state[key] = object.toGameState());
    return state;
  }
}

