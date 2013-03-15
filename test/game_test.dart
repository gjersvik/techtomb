library game_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';
import 'game/trigger_action_test.dart' as TriggerActionTest;
import 'game/analog_action_test.dart' as AnalogActionTest;
import 'game/actions_test.dart' as ActionsTest;
import 'game/game_object_test.dart' as GameObjectTest;

main() {
  useVMConfiguration();

  TriggerActionTest.main();
  AnalogActionTest.main();
  ActionsTest.main();
  GameObjectTest.main();
}


