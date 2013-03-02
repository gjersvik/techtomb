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
  
  State make(num gametime, Map data, [DateTime time]){
    if(!?time){
      time = new DateTime.now();
    }
    var state = new State(data,time);
    state.framecount = framecount + 1;
    state.gameTime = gametime;
    state.lastGameTime = gameTime;
    return state;
  }
}

