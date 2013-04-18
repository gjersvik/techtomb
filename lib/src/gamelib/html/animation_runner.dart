part of techtomb_gamelib_html;

class AnimationRunner extends Runner {
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
