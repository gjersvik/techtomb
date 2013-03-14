library actions;

import 'analog_action.dart';
export 'analog_action.dart';

import 'trigger_action.dart';
export 'trigger_action.dart';

class Actions {
  Map<String,TriggerAction> actions;
  
  add(TriggerAction action) => actions[action.name] = action;
  
  List<Map> get data{
    List data = [];
    
    actions.values.forEach((v){
      var temp = v.data;
      if(temp.isEmpty == false){
        data.add(v);
      }
    });
    
    return data;
  }
  void set data(List<Map> data){
    data.forEach((value){
      if(actions.containsKey(value['name'])){
        actions['name'].data = value;
      }
    });
  }
  
  reset() => actions.forEach((k, v) =>v.reset());
}
