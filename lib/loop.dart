library loop;

import 'loop/runner.dart';
export 'loop/runner.dart';

class Loop {
  final Runner runner;
  List callbacks;
  Stopwatch _gametime;
  int _count = 0;
  
  Loop(this.runner):
    callbacks = new List(),
    _gametime = new Stopwatch();
  
  _tic(){
    _count += 1;
    var loop_event = {};
    loop_event['gametime'] = _gametime.elapsedTicks / _gametime.frequency;
    loop_event['ticCount'] = _count;
    callbacks.forEach((f) => f(loop_event) );
  }
  
  start() {
    _gametime.start();
    runner.start(_tic);
  }
  
  pause() {
    _gametime.stop();
    runner.stop();
  }
  
  end() {
    _gametime.stop();
    _gametime.reset();
    _count = 0;
    runner.stop();
  }
}
