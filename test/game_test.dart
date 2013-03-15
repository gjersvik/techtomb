library game_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';
import 'game/trigger_action_test.dart' as TriggerActionTest;
import 'game/analog_action_test.dart' as AnalogActionTest;
import 'game/actions_test.dart' as ActionsTest;

main() {
  useVMConfiguration();

  TriggerActionTest.main();
  AnalogActionTest.main();
  ActionsTest.main();
}


