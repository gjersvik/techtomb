library share_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';
import 'share/loop_test.dart' as LoopTest;

main() {
  useVMConfiguration();

  LoopTest.main();
}

