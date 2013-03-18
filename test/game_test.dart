library game_test;

import 'packages/unittest/vm_config.dart';
import 'packages/unittest/unittest.dart';

import 'game/game_object_test.dart' as GameObjectTest;
import 'game/game_objects_test.dart' as GameObjectsTest;

main() {
  useVMConfiguration();

  GameObjectTest.main();
  GameObjectsTest.main();
}
