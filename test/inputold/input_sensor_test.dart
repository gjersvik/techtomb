library test.input_sensor;

import 'package:unittest/unittest.dart';
import 'package:gamelib/input/input_sensor.dart';
import 'package:gamelib/input/input_data.dart';

main(){
  group('InputSensor:',() {
    test('getNewData return a new instanse of InputData',() {
      var sensor = new InputSensor();
      expect(sensor.getNewData(), new isInstanceOf<InputData>());
    });
    test('have a property data for active InputData',() {
      var sensor = new InputSensor();
      expect(sensor.data, new isInstanceOf<InputData>());
    });
    test('newVersion sets a new instanase as data and returns the old one;',() {
      var sensor = new InputSensor();
      expect(sensor.newVertion().version, 0);
      expect(sensor.data.version, 1);
    });
    test('you can recycle old InputData for reuse',() {
      var sensor = new InputSensor();
      var data = new InputData();
      sensor.recycle(data);
      sensor.newVertion();
      expect(sensor.data, data);
    });
  });
}

