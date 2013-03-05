library test.loop;

import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import 'package:gamelib/loop.dart';

class MockRunner extends Mock implements Runner{}

main(){
  group('Loop:',() {
    test('onBefore is a broadcast Stream',() {
      var loop = new Loop();
      expect(loop.onBefore.isBroadcast, isTrue);
    });
    test('onLoop is a broadcast Stream',() {
      var loop = new Loop();
      expect(loop.onLoop.isBroadcast, isTrue);
    });
    test('onAfter is a broadcast Stream',() {
      var loop = new Loop();
      expect(loop.onAfter.isBroadcast, isTrue);
    });
  });
}

