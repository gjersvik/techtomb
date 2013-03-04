library test.input_data;

import 'package:unittest/unittest.dart';
import 'package:gamelib/input/input_data.dart';

main(){
  group('InputData:',() {
    test('Have a property version',() {
      var data = new InputData();
      expect(data.version, 0);
    });
    test('Clear sets version to zero and returns this',() {
      InputData data = new InputData();
      data.version = 5;
      expect(data.clear().version, 0);
    });
    test('Make adds one to version',() {
      InputData data = new InputData();
      data.version = 5;
      
      expect(data.make().version, 6);
    });
  });
}