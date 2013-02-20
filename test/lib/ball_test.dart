library test.lib.ball;

import 'package:unittest/unittest.dart';
import 'package:htmlblock/ball.dart';

main(){
  group('Ball:',() {
    test('new Ball(10,5) returns a ball object with x:10',() {
      var ball = new Ball(10,5);
      expect(ball.x, 10);
    });
  });
}

