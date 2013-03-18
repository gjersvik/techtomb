library input_actions_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/input.dart';

main(){
  group('InputActions:',() {
    test('toMap() returns a map of all changed actions',() {
      var actions = new InputActions();
      actions.add(new ButtonAction('TestAction1')..value = true);
      actions.add(new SwitchAction('TestAction2'));
      actions.add(new NubAction('TestAction3')..value = 0.5);

      expect(actions.toMap(), {'TestAction1': true, 'TestAction3': 0.5});
    });
  });
}


