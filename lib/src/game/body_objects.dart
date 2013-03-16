part of htmlblock_game;

class BodyObjects extends GameObjects {
  void preStep() => objects.forEach((_, object) => object.preStep());
  void postStep() => objects.forEach((_, object) => object.postStep());
}