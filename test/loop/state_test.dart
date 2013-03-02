library test.loop_state;

import 'package:unittest/unittest.dart';
import 'package:gamelib/loop/state.dart';

main(){
  group('State:',() {
    test('DateTime time is utc time.',() {
      var time = new DateTime.now();
      var state = new State({}, time);
      expect(state.time, time.toUtc());
    });
    test('State.gameTime is num.',() {
      var state = new State({});
      expect(state.gameTime, 0);
    });
    test('State.lastGameTime is num.',() {
      var state = new State({});
      expect(state.lastGameTime, 0);
    });
    test('State.framecount is int.',() {
      var data = new State({});
      expect(data.framecount, 0);
    });
    test('State.data is Map.',() {
      var data = {'data': true};
      var state = new State(data);
      expect(state.data, data);
    });
    test('make() increase framecount with 1',() {
      var state = new State({});
      expect(state.make(0.1,{}).framecount, 1);
    });
    test('make() sets new gametime',() {
      var state = new State({});
      expect(state.make(0.2,{}).gameTime, 0.2);
    });
    test('make()  lastGametime is the samme as past gametime',() {
      var state = new State({});
      state.gameTime = 0.1;
      expect(state.make(0.2,{}).lastGameTime, 0.1);
    });
  });
}