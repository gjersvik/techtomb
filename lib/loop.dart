library loop;

import "dart:async";

import 'loop/runner.dart';
export 'loop/runner.dart';

class Loop {
  final Runner runner;
  
  Loop(this.runner){
  }
  
  start() {
    runner.start(() {});
  }
  
  end() {
    runner.stop();
  }
}