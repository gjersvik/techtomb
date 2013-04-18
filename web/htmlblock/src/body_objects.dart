part of techtomb_htmlblock;

class BodyObjects<T extends BodyObject> extends GameObjects<T> {
  void preStep() => objects.values.toList().forEach((object) => object.preStep());
  void postStep() => objects.values.toList().forEach((object) => object.postStep());
}