part of gamelib_game;

class GameObjects{
  Map<String, GameObject> objects = {};

  GameObject get(String name) => objects[name];
  GameObject add(GameObject o) => objects[o.name] = o;
  GameObject remove(String name) => objects.remove(name);
  GameObject removeObject(GameObject o) => remove(o.name);

  Map<String, Map<String,dynamic>> toGameState() {
    var state = {};
    objects.forEach((key, object) => state[key] = object.toGameState());
    return state;
  }
}

