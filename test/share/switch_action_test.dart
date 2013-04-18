library switch_action_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/share.dart';

main(){
  group('SwitchAction:',() {
    test('is of type switch.',() {
      var action = new SwitchAction('TestAction1');
      expect(action.type, 'switch');
    });
    test('value starts as false.',() {
      var action = new SwitchAction('TestAction1');
      expect(action.value, false);
    });
  });
}


