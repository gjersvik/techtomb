part of htmlblock_game;

class BodyObjects<T extends BodyObject> extends GameObjects<T> {
  void preStep() => objects.values.toList().forEach((object) => object.preStep());
  void postStep() => objects.values.toList().forEach((object) => object.postStep());
}