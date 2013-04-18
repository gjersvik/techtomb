library game_actions_test;

import 'package:unittest/unittest.dart';
import 'package:techtomb/gamelib.dart';

main(){
  group('GameActions:',() {
    test('fromMap() add value to all actions that exists.',() {
      var actions = new GameActions();
      var a1 = actions.add(new ButtonAction('TestAction1'));
      var a2 = actions.add(new SwitchAction('TestAction2'));
      var a3 = actions.add(new NubAction('TestAction3'));

      actions.fromMap({'TestAction1': true, 'TestAction3': 0.5});

      expect(a1.value, true);
      expect(a2.value, false);
      expect(a3.value, 0.5);
    });
  });
}

