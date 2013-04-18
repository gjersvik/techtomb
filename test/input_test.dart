library input_test;

import 'package:unittest/vm_config.dart';
import 'package:unittest/unittest.dart';

import 'input/input_actions_test.dart' as InputActionsTest;

main() {
  useVMConfiguration();

  InputActionsTest.main();
}


