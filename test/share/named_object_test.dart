library named_object_test;

import 'package:unittest/unittest.dart';
import 'package:techtomb/gamelib.dart';

main(){
  group('NamedObject:',() {
    test('have a name.',() {
      var object = new NamedObject('Testname');
      expect(object.name, 'Testname');
    });
  });
}


