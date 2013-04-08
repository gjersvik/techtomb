library tools_task_test;

import 'package:unittest/unittest.dart';
import 'package:args/args.dart';
import 'package:tools/tools.dart' show Task;

class TestTask extends Task{
  TestTask(name): super(name);

  void run(ArgResults results){}
}

main(){
  group('Task:',() {
    test('have a name',() {
      var task = new TestTask('test');
      expect(task.name, 'test');
    });
    test('have metode run',() {
      var task = new TestTask('test');
      task.run(new ArgResults({},'testname',null,[]));
    });
  });
}
