library analog_action_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/analog_action.dart';

main(){
  group('AnalogAction:',() {
    test('have a name.',() {
      var action = new AnalogAction('TestAction1');
      expect(action.name, 'TestAction1');
    });
    test('have a value.',() {
      var action = new AnalogAction('TestAction1');
      action.value = 0.5;
      expect(action.value, 0.5);
    });
    test('set value tiggers it.',() {
      var action = new AnalogAction('TestAction1');
      action.value = 0.5;
      expect(action.triggerd, true);
    });
    test('set value tiggers if is diffrent than old value.',() {
      var action = new AnalogAction('TestAction1');
      action.value = 0.5;
      action.reset();
      action.value = 0.5;
      expect(action.triggerd, false);
    });
    test('data has value.',() {
      var action = new AnalogAction('TestAction1');
      action.value = 0.5;
      expect(action.data['value'], 0.5);
    });
    test('data sets value.',() {
      var action = new AnalogAction('TestAction1');
      action.data = {'name': 'TestAction1','value': 0.5};
      expect(action.value, 0.5);
    });
  });
}
