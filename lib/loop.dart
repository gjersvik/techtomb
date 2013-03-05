library loop;

import "dart:async";

import 'loop/state.dart';
export 'loop/state.dart';

import 'loop/runner.dart';
export 'loop/runner.dart';

class Loop {
  var _onBefore;
  var _onLoop;
  var _onAfter;
  
  Loop(){
    _onBefore = new StreamController<State>.broadcast();
    _onLoop = new StreamController<State>.broadcast();
    _onAfter = new StreamController<State>.broadcast();
  }
  
  Stream<State> get onBefore => _onBefore.stream;
  Stream<State> get onLoop => _onLoop.stream;
  Stream<State> get onAfter => _onAfter.stream;
}