library loop_state;

class State{
  DateTime time;
  
  State([DateTime time]){
    if(!?time){
      time = new DateTime.now();
    }
    this.time = time.toUtc();
  }
}

