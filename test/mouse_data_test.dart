library test.mouse_data;

import 'package:unittest/unittest.dart';
import 'package:gamelib/mouse_data.dart';

main(){
  group('MouseData:',() {
    test('Have a property x',() {
      var data = new MouseData();
      expect(data.x, 0);
    });
    test('Clear sets x to zero',() {
      MouseData data = new MouseData();
      data.x = 5;
      data.clear();
      expect(data.x, 0);
    });
    test('Make copy x',() {
      MouseData data = new MouseData();
      data.x = 5;
      expect(data.make().x, 5);
    });
  });
}

