part of gamelib_game;

class GameObjects extends NamedObjects<GameObject>{
  Map<String, Map<String,dynamic>> toGameState() {
    var state = {};
    objects.forEach((key, object) => state[key] = object.toGameState());
    return state;
  }
}

