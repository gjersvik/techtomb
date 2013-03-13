library loop;

import 'loop/runner.dart';
export 'loop/runner.dart';

class Loop {
  final Runner runner;
  List callbacks;
  
  Loop(this.runner):callbacks = new List();
  
  _tic(){
    var loop_event = {};
    callbacks.forEach((f) => f(loop_event) );
  }
  
  start() {
    runner.start(_tic);
  }
  
  end() {
    runner.stop();
  }
}