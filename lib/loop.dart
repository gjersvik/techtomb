library loop;

import "dart:async";

import 'loop/runner.dart';
export 'loop/runner.dart';

class Loop {
  final Runner runner;
  List callbacks;
  
  Loop(this.runner):callbacks = new List();
  
  _tic(){
    callbacks.forEach((f) => f());
  }
  
  start() {
    runner.start(_tic);
  }
  
  end() {
    runner.stop();
  }
}