part of gamelib_share;

class NamedObjects{
  Map<String, NamedObject> objects = {};

  NamedObject get(String name) => objects[name];
  NamedObject add(NamedObject o) => objects[o.name] = o;
  NamedObject remove(String name) => objects.remove(name);
  NamedObject removeObject(NamedObject o) => remove(o.name);
}



