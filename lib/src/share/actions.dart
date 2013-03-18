part of gamelib_share;

class Actions extends NamedObjects<Action> {
  reset() => objects.forEach((k, v) =>v.reset());
}
