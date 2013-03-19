part of gamelib_game;

class TimerRunner extends Runner {
  var _timer;

  start( Function tic) {
    _timer = new Timer.periodic(new Duration(milliseconds:16),(_)=>tic());
  }
  stop() {
    _timer.cancel();
  }
}
