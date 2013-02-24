library test.input_data;

import 'package:unittest/unittest.dart';
import 'package:gamelib/input_data.dart';

main(){
  group('InputData:',() {
    test('Have a property version',() {
      var data = new InputData();
      expect(data.version, 0);
    });
  });
}