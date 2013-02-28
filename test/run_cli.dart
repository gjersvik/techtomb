library test.run_all;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'input/input_data_test.dart' as InputDataTest;
import 'input/mouse_data_test.dart' as MouseDataTest;
import 'input/input_sensor_test.dart' as InputSensorTest;

import 'loop/state_test.dart' as LoopStateTest;


main() {
  useVMConfiguration();
  
  InputDataTest.main();
  MouseDataTest.main();
  InputSensorTest.main();
  
  LoopStateTest.main();
}

