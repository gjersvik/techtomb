library input_data;

class InputData {
  int version = 0;
  
  InputData();
  
  void clear () {
    version = 0;
  }
  
  InputData make ([InputData recycle]) {
    if(?recycle){
      recycle.clear();
    }else{
      recycle = new InputData();
    }
    
    recycle.version = this.version + 1;
    return recycle;
  }
}