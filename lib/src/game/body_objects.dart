part of htmlblock_game;

class BodyObjects extends GameObjects {
  void preStep() => objects.forEach((_, object) => object.preStep());
  void postStep(){
    var delete = [];
    objects.forEach((_,BodyObject object){
      object.postStep();
      if(object.removeme){
        delete.add(object.name);
      }
    });
    delete.forEach((name)=> remove(name));
  }
}