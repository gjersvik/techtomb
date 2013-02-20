library test.run_all;

import '../packages/unittest/vm_config.dart';
import '../packages/unittest/unittest.dart';

import 'lib/ball_test.dart' as test_lib_ball;

main() {
  useVMConfiguration();
  
  test_lib_ball.main();
}