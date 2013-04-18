library techtomb_gamelib_test;

import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart' as Mock;
import 'package:techtomb/gamelib.dart';

part 'src/action_test.dart';
part 'src/actions_test.dart';
part 'src/button_action_test.dart';
part 'src/game_actions_test.dart';
part 'src/game_object_test.dart';
part 'src/game_objects_test.dart';
part 'src/input_actions_test.dart';
part 'src/loop_test.dart';
part 'src/named_object_test.dart';
part 'src/named_objects_test.dart';
part 'src/nub_action_test.dart';
part 'src/switch_action_test.dart';
part 'src/timeline_test.dart';

void main() {
  group('GameLib ',() {
    testAction();
    testActions();
    testButtonAction();
    testGameActions();
    testGameObject();
    testGameObjects();
    testInputActions();
    testLoop();
    testNamedObject();
    testNamedObjects();
    testNubAction();
    testSwitchAction();
    testTimeline();
  });
}


