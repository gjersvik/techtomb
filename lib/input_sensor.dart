library input_sensor;

import 'input_data.dart';

class InputSensor {
  List _recycle = new List();
  InputData data;
  
  InputSensor(){
    data = getNewData();
  }
  
  InputData newVertion(){
    var olddata = data;
    var newdata;
    if(!_recycle.isEmpty){
      newdata = _recycle.removeLast();
    } else {
      newdata = getNewData();
    }
    
    data = olddata.make(newdata);
    return olddata;
  }
  
  void recycle(InputData old) => _recycle.add(old);
  
  InputData getNewData() => new InputData();
}