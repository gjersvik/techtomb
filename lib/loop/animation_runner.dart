library animation_runner;

import 'dart:html';

import 'runner.dart';
export 'runner.dart';


class TimerRunner extends Runner {
  var _tic = null;
  
  _callback( _ ) {
    if(_tic != null){
      _tic();
      window.requestAnimationFrame(_callback);
    }
  }
  
  start( Function tic) {
    _tic = tic;
    window.requestAnimationFrame(_callback);
  }
  stop() {
    _tic = null;
  }
}
