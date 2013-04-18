part of techtomb_gamelib;

class Actions extends NamedObjects<Action> {
  reset() => objects.forEach((k, v) =>v.reset());
}
