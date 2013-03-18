library render_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'render/timeline_test.dart' as TimelineTest;

main() {
  useVMConfiguration();

  TimelineTest.main();
}
