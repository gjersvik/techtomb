part of gamelib_share;

class Action {
  final String name;
  final String type;
  bool changed = false;
  var _value;
  Action(this.name, this.type);

  get value => _value;
  set value(value){
    if(value != _value ){
      _value = value;
      changed = true;
    }
  }

  void reset(){
    changed = false;
  }
}

