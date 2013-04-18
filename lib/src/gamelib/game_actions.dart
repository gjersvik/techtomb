part of techtomb_gamelib;

class GameActions extends Actions{
  fromMap(Map map){
    map.forEach((key, value){
      if(objects.containsKey(key)){
        objects[key].value = value;
      }
    });
  }
}

