library actions_test;

import 'package:unittest/unittest.dart';
import 'package:techtomb/gamelib.dart';

main(){
  group('Actions:',() {
    test('reset() resets all.',() {
      var actions = new Actions();
      actions.add(new Action('TestAction1','test')..changed = true);

      actions.reset();

      expect(actions.objects['TestAction1'].changed, false);
    });
  });
}
