library test.loop_state;

import 'package:unittest/unittest.dart';
import 'package:gamelib/loop/state.dart';

main(){
  group('State:',() {
    test('DateTime time is utc time.',() {
      var time = new DateTime.now();
      var data = new State(time);
      expect(data.time, time.toUtc());
    });
  });
}