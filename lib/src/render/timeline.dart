part of gamelib_render;

class Timeline{
  Queue<_TimelineState> _states;
  int size;

  Timeline(this.size): _states = new Queue<_TimelineState>();

  void add(num time, Map state){
    _states.addFirst(new _TimelineState(time,state));
    if(_states.length > size){
      _states.removeLast();
    }
  }
  Map get(num time){
    if(_states.isEmpty){
      return {};
    }
    if(time <= _states.last.time){
      return _states.last.state;
    }
    if(time >= _states.first.time ){
      return _states.first.state;
    }
    _TimelineState small = _states.firstMatching((state) => state.time <= time);
    _TimelineState big = _states.lastMatching((state) => state.time >= time);
    if(big == small){
      return big.state;
    }
    var value = (time - small.time) / (big.time - small.time);
    return _interpolateMap(small.state, big.state, value);
  }
  clear(){
    _states.clear();
  }

  Map _interpolateMap(Map a,Map b,num value){
    var out = {};
    var keys = new Set.from(a.keys);
    keys.addAll(b.keys);

    keys.forEach((key){
      var v = _interpolateValue(a[key],b[key],value);
      if(v != null){
        out[key] = v;
      }
    });
    return out;
  }

  _interpolateValue( a, b,num value){
    if(a is Map && b is Map){
      return _interpolateMap(a, b, value);
    }
    if(a is num && b is num){
      return _interpolateNum(a, b, value);
    }
    return value < 0.5? a : b;
  }

  num _interpolateNum(num a,num b,num value) => b * value + a * (1 - value);
}

class _TimelineState{
  num time;
  Map state;
  _TimelineState(this.time,this.state);
}
