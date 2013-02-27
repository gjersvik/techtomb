library input_data;

class InputData {
  int version = 0;
  
  InputData();
  
  InputData clear () {
    version = 0;
    return this;
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