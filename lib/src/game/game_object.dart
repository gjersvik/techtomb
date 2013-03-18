part of gamelib_game;

class GameObject extends NamedObject{
  final String type;

  GameObject(name,this.type): super(name);

  Map<String, dynamic> toGameState() => {'type' :type};
}