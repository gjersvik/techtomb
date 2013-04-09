library tools_task_test;

import 'package:unittest/unittest.dart';
import 'package:args/args.dart';
import 'package:tools/tools.dart' show Task;

class TestTask extends Task{
  TestTask(name): super(name);

  void setup(ArgParser parser){}
  Future<int> run(ArgResults results){}
}

main(){
  group('Task:',() {
    test('have a name',() {
      var task = new TestTask('test');
      expect(task.name, 'test');
    });
  });
}
