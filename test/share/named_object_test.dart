library named_object_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/share.dart';

main(){
  group('NamedObject:',() {
    test('have a name.',() {
      var object = new NamedObject('Testname');
      expect(object.name, 'Testname');
    });
  });
}


