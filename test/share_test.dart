library share_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'share/named_object_test.dart' as NamedObjectTest;
import 'share/named_objects_test.dart' as NamedObjectsTest;
import 'share/loop_test.dart' as LoopTest;
import 'share/trigger_action_test.dart' as TriggerActionTest;
import 'share/analog_action_test.dart' as AnalogActionTest;
import 'share/actions_test.dart' as ActionsTest;
import 'share/action_test.dart' as ActionTest;

main() {
  useVMConfiguration();

  NamedObjectTest.main();
  NamedObjectsTest.main();
  LoopTest.main();
  TriggerActionTest.main();
  AnalogActionTest.main();
  ActionsTest.main();
  ActionTest.main();
}
