library timer_runner;

import 'dart:async';

import 'runner.dart';
export 'runner.dart';

class TimerRunner extends Runner {
  var _timer;
  
  start( Function tic) {
    _timer = new Timer.repeating(new Duration(milliseconds:16),(_)=>tic());
  }
  stop() {
    _timer.cancel();
  }
}
