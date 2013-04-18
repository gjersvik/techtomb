library share_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'share/named_object_test.dart' as NamedObjectTest;
import 'share/named_objects_test.dart' as NamedObjectsTest;
import 'share/loop_test.dart' as LoopTest;
import 'share/action_test.dart' as ActionTest;
import 'share/button_action_test.dart' as ButtonActionTest;
import 'share/switch_action_test.dart' as SwitchActionTest;
import 'share/nub_action_test.dart' as NubActionTest;
import 'share/actions_test.dart' as ActionsTest;
main() {
  useVMConfiguration();

  NamedObjectTest.main();
  NamedObjectsTest.main();
  LoopTest.main();
  ActionTest.main();
  ButtonActionTest.main();
  SwitchActionTest.main();
  NubActionTest.main();
  ActionsTest.main();
}
