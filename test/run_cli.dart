library test.run_all;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'input_data_test.dart' as InputDataTest;

main() {
  useVMConfiguration();
  
  InputDataTest.main();
}

