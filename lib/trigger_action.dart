library trigger_action;

class TriggerAction{
  final String name;
  bool _triggerd = false;
  
  TriggerAction(this.name);
  
  bool get triggerd => _triggerd;
  
  Map<String,dynamic> get data{
    var data = new Map();
    if(_triggerd == true){
      data['name'] = name;
    }
    return data;
  }
  void set data(Map<String,dynamic> data){
    if(data['name'] == name){
      trigger(); 
    }
  }
  
  void trigger() {
    _triggerd = true;
  }
  void reset(){ 
    _triggerd = false;
  }
}
