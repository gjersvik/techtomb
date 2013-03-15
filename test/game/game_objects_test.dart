library game_object_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/game.dart';

main(){
  group('GameObjects:',() {
    test('add returns added object',() {
      var objects = new GameObjects();
      var object = new GameObject('TestName','TestType');
      expect(objects.add(object), object);
    });
    test('get returns object',() {
      var objects = new GameObjects();
      var object = new GameObject('TestName','TestType');
      objects.add(object);
      expect(objects.get('TestName'), object);
    });
    test('remove removes object by name',() {
      var objects = new GameObjects();
      objects.add(new GameObject('TestName','TestType'));
      objects.remove('TestName');
      expect(objects.get('TestName'), isNull);
    });
    test('removeObject removes object by object',() {
      var objects = new GameObjects();
      var object = new GameObject('TestName','TestType');
      objects.add(object);
      objects.removeObject(object);
      expect(objects.get('TestName'), isNull);
    });
    test('toGameState returns a map of maps',() {
      var objects = new GameObjects();
      objects.add(new GameObject('TestName','TestType'));
      expect(objects.toGameState(), {'TestName':{'type': 'TestType'}});
    });
  });
}

