library game_object_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/game.dart';

main(){
  group('GameObject:',() {
    test('name from constructor.',() {
      var object = new GameObject('TestName','TestType');
      expect(object.name, 'TestName');
    });
    test('type from constructor.',() {
      var object = new GameObject('TestName','TestType');
      expect(object.type, 'TestType');
    });
    test('toGameState returns type info',() {
      var object = new GameObject('TestName','TestType');
      expect(object.toGameState(), {'type':'TestType'});
    });
  });
}