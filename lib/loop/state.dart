library loop_state;

class State{
  DateTime time;
  num gameTime = 0;
  num lastGameTime = 0;
  int framecount = 0;
  Map data;
  
  State(this.data, [DateTime time]){
    if(!?time){
      time = new DateTime.now();
    }
    this.time = time.toUtc();
  }
}

