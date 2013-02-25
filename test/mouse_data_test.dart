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
    test('Have a property y',() {
      var data = new MouseData();
      expect(data.y, 0);
    });
    test('Clear sets y to zero',() {
      MouseData data = new MouseData();
      data.y = 5;
      data.clear();
      expect(data.y, 0);
    });
    test('Make copy y',() {
      MouseData data = new MouseData();
      data.y = 5;
      expect(data.make().y, 5);
    });
  });
}

