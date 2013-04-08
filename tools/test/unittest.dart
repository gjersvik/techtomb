library tools_unittest;

import 'package:unittest/vm_config.dart';
import 'package:unittest/unittest.dart';

import 'task_test.dart' as task;

main() {
  useVMConfiguration();

  task.main();
}

