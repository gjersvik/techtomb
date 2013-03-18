part of game_input;

class InputActions extends Actions{
  Map<String,dynamic> toMap(){
    var out = {};
    objects.forEach((name,action){
      if(action.changed){
        out[name] = action.value;
      }
    });
    return out;
  }
}