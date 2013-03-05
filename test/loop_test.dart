library test.loop;

import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import 'package:gamelib/loop.dart';

class MockRunner extends Mock implements Runner{}

main(){
  group('Loop:',() {
    test('Loop.start() calls Runner.start() wit a tic function',() {
      fail('Test not implemented');
    });
    test('Loop.end() calls Runner.end()',() {
      fail('Test not implemented');
    });
    test('When the tic function is called all the callbacks gets runned',() {
      fail('Test not implemented');
    });
  });
}

