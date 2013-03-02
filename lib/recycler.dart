library recycler;

class Recycler {
  List<Recycle> _cache;
  Function _constuctor;
  
  Recycler( Recycle constuctor()){
    _constuctor = constuctor;
  }
  
  Recycle take() => _cache.isEmpty ? _constuctor() : _cache.removeLast();
  void release(Recycle object) {
    object.clear();
    _cache.add(object);
  }
}

abstract class Recycle{
  void clear();
}