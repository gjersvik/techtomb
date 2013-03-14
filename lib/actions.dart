library actions;

import 'analog_action.dart';
export 'analog_action.dart';

import 'trigger_action.dart';
export 'trigger_action.dart';

class Actions {
  Map<String,TriggerAction> actions;
  
  Actions():actions = {};
  
  TriggerAction add(TriggerAction action) => actions[action.name] = action;
  
  List<Map> get data{
    List data = [];
    
    actions.values.forEach((v){
      var temp = v.data;
      if(temp.isEmpty == false){
        data.add(temp);
      }
    });
    
    return data;
  }
  void set data(List<Map> data){
    data.forEach((value){
      if(actions.containsKey(value['name'])){
        actions[value['name']].data = value;
      }
    });
  }
  
  reset() => actions.forEach((k, v) =>v.reset());
}
