library render_test;

import 'package:unittest/vm_config.dart';
import 'package:unittest/unittest.dart';

import 'render/timeline_test.dart' as TimelineTest;

main() {
  useVMConfiguration();

  TimelineTest.main();
}
