part of gamelib_game;

class AnalogAction extends TriggerAction{
  double _value;
  double _prev;

  AnalogAction(name):super(name);

  double get value => _value;
  void set value(double value) {
    _value = value;
    if(_value == _prev){
      super.reset();
    }else {
      trigger();
    }
  }

  Map<String,dynamic> get data{
    var data = super.data;
    if(triggerd == true){
      data['value'] = _value;
    }
    return data;
  }
  void set data(Map<String,dynamic> data){
    if(data['name'] == name){
      value = data['value'];
    }
  }

  void reset() {
    super.reset();
    _prev = _value;
  }
}