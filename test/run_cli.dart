library test.run_all;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';
import 'loop_test.dart' as LoopTest;
import 'trigger_action_test.dart' as TriggerActionTest;

main() {
  useVMConfiguration();
  
  LoopTest.main();
  TriggerActionTest.main();
}

