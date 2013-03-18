library analogs_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/share.dart';

main(){
  group('Analogs:',() {
    test('add() adds and action.',() {
      var actions = new Actions();
      var action = new TriggerAction('TestAction1');

      actions.add(action);
      expect(actions.actions['TestAction1'], action);
    });
    test('get data.',() {
      var actions = new Actions();
      actions.add(new TriggerAction('TestAction1')).trigger();
      actions.add(new TriggerAction('TestAction2'));


      expect(actions.data, [{'name': 'TestAction1'}]);
    });
    test('set data.',() {
      var actions = new Actions();
      actions.add(new TriggerAction('TestAction1'));

      actions.data = [{'name': 'TestAction1'}];

      expect(actions.actions['TestAction1'].triggerd, true);
    });
    test('reset() resets all.',() {
      var actions = new Actions();
      actions.add(new TriggerAction('TestAction1')..trigger());

      actions.reset();

      expect(actions.actions['TestAction1'].triggerd, false);
    });
  });
}
