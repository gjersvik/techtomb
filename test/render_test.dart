library render_test;

import 'packages/unittest/html_config.dart';
import 'packages/unittest/unittest.dart';

import 'share/loop_test.dart' as LoopTest;

main() {
  useHtmlConfiguration();

  test('Testing falure in drone.io',() {
    fail('Just fail already');
  });
}


