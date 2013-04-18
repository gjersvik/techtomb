part of techtomb_gamelib;

class NamedObjects<T extends NamedObject>{
  Map<String, T> objects = {};

  T get(String name) => objects[name];
  T add(T o) => objects[o.name] = o;
  T remove(String name) => objects.remove(name);
  T removeObject(T o) => remove(o.name);
}



