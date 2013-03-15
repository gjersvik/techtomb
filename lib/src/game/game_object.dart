part of gamelib_game;

class GameObject{
  final String name;
  final String type;

  GameObject(this.name,this.type);

  Map<String, dynamic> toGameState() => {'type' :type};
}