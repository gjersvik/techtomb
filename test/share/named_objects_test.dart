library named_objects_test;

import 'package:unittest/unittest.dart';
import 'package:techtomb/gamelib.dart';

main(){
  group('NamedObjects:',() {
    test('add returns added object',() {
      var objects = new NamedObjects();
      var object = new NamedObject('TestName');
      expect(objects.add(object), object);
    });
    test('get returns object',() {
      var objects = new NamedObjects();
      var object = new NamedObject('TestName');
      objects.add(object);
      expect(objects.get('TestName'), object);
    });
    test('remove removes object by name',() {
      var objects = new NamedObjects();
      objects.add(new NamedObject('TestName'));
      objects.remove('TestName');
      expect(objects.get('TestName'), isNull);
    });
    test('removeObject removes object by object',() {
      var objects = new NamedObjects();
      var object = new NamedObject('TestName');
      objects.add(object);
      objects.removeObject(object);
      expect(objects.get('TestName'), isNull);
    });
  });
}


