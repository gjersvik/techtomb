part of gamelib_share;

class Loop {
  final Runner runner;
  SplayTreeMap<int,StreamController<Map>> _streams;
  Map<int,Stream<Map>> _liseners;
  Stopwatch _gametime;
  int _count = 0;

  Loop(this.runner):
    _streams = new SplayTreeMap(),
    _liseners = new Map(),
    _gametime = new Stopwatch();

  Stream<Map> operator [](int i){
     if(!_streams.containsKey(i)){
       _streams[i] = new StreamController();
       _liseners[i] = _streams[i].stream.asBroadcastStream();
     }
     return _liseners[i];
  }

  _tic(){
    _count += 1;
    var loop_event = {
        'gametime': _gametime.elapsedTicks / _gametime.frequency,
        'ticCount': _count
    };
    _streams.forEach((_,c) => c.add(loop_event));
  }

  void start() {
    _gametime.start();
    runner.start(_tic);
  }

  void pause() {
    _gametime.stop();
    runner.stop();
  }

  void end() {
    pause();
    _gametime.reset();
    _count = 0;
  }
}
