library trigger_action_test;

import 'package:unittest/unittest.dart';
import 'package:gamelib/game.dart';

main(){
  group('TriggerAction:',() {
    test('have a name.',() {
      var action = new TriggerAction('TestAction1');
      expect(action.name, 'TestAction1');
    });
    test('trigger() sets triggerd to true.',() {
      var action = new TriggerAction('TestAction1');
      action.trigger();
      expect(action.triggerd, true);
    });
    test('reset() sets triggerd to false.',() {
      var action = new TriggerAction('TestAction1');
      action.trigger();
      action.reset();
      expect(action.triggerd, false);
    });
    test('get data if triggerd.',() {
      var action = new TriggerAction('TestAction1');
      expect(action.data, {});
      action.trigger();
      expect(action.data, {'name': 'TestAction1'});
    });
    test('trigger if data matshes name.',() {
      var action = new TriggerAction('TestAction1');
      action.data = {};
      expect(action.triggerd, false);
      action.data = {'name': 'TestAction1'};
      expect(action.triggerd, true);
    });
  });
}
