library test.mouse_data;

import '../../packages/unittest/unittest.dart';
import 'package:gamelib/input/mouse_data.dart';

main(){
  group('MouseData:',() {
    test('Have a property x',() {
      var data = new MouseData();
      expect(data.x, 0);
    });
    test('Clear sets x to zero',() {
      MouseData data = new MouseData();
      data.x = 5;
      expect(data.clear().x, 0);
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
      expect(data.clear().y, 0);
    });
    test('Make copy y',() {
      MouseData data = new MouseData();
      data.y = 5;
      expect(data.make().y, 5);
    });
    
    test('Have a property buttons that is an empty Set',() {
      var data = new MouseData();
      expect(data.buttons, isEmpty);
      expect(data.buttons, new isInstanceOf<Set>());
    });
    test('Clear sets buttons to empty set',() {
      MouseData data = new MouseData();
      data.buttons.add(0);
      expect(data.clear().buttons, isEmpty);
    });
    test('Make copy of buttons',() {
      MouseData data = new MouseData();
      data.buttons.add(0);
      expect(data.make().buttons, hasLength(1));
    });
    
    test('Have a property clicks that is an empty Set',() {
      var data = new MouseData();
      expect(data.clicks, isEmpty);
      expect(data.clicks, new isInstanceOf<Set>());
    });
    test('Clear sets clicks to empty set',() {
      MouseData data = new MouseData();
      data.clicks.add(0);
      expect(data.clear().clicks, isEmpty);
    });
    test('Make ingores clicks',() {
      MouseData data = new MouseData();
      data.clicks.add(0);
      expect(data.make().clicks, isEmpty);
    });
  });
}

