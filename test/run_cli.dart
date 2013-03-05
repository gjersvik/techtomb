library test.run_all;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';
import 'loop_test.dart' as LoopTest;

main() {
  useVMConfiguration();
  
  LoopTest.main();
}

