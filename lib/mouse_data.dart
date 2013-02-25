library mouse_data;

import 'input_data.dart';

class MouseData extends InputData {
  num x = 0;
  
  MouseData():super();
  
  void clear() {
    x = 0;
    return super.clear();
  }
  
  MouseData make ([MouseData recycle]) {
    if(!?recycle){
      recycle = new MouseData();
    }
    recycle = super.make(recycle);
    
    recycle.x = this.x;
    return recycle;
  }
}