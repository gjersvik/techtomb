library mouse_data;

import 'input_data.dart';

class MouseData extends InputData {
  num x = 0;
  num y = 0;
  Set<int> buttons = new Set();
  
  MouseData():super();
  
  void clear() {
    x = 0;
    y = 0;
    buttons.clear();
    return super.clear();
  }
  
  MouseData make ([MouseData recycle]) {
    if(!?recycle){
      recycle = new MouseData();
    }
    recycle = super.make(recycle);
    
    recycle.x = x;
    recycle.y = y;
    recycle.buttons.addAll(buttons);
    return recycle;
  }
}