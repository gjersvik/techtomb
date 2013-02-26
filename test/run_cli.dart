library test.run_all;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'input_data_test.dart' as InputDataTest;
import 'mouse_data_test.dart' as MouseDataTest;
import 'input_sensor_test.dart' as InputSensorTest;


main() {
  useVMConfiguration();
  
  InputDataTest.main();
  MouseDataTest.main();
  InputSensorTest.main();
}

