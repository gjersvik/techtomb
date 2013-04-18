part of techtomb_gamelib;

class Action extends NamedObject{
  final String type;
  bool changed = false;
  var _value;
  Action(name, this.type): super(name);

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

