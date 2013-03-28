library input_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'input/input_actions_test.dart' as InputActionsTest;

main() {
  useVMConfiguration();

  InputActionsTest.main();
}


