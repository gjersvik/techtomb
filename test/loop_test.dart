library test.loop;

import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import 'package:gamelib/loop.dart';

class MockRunner extends Mock implements Runner{}

main(){
  group('Loop:',() {
    test('Loop.start() calls Runner.start() wit a tic function',() {
      var mock = new MockRunner();
      var loop = new Loop(mock);
      loop.start();
      
      mock.getLogs(callsTo('start', new isInstanceOf<Function>())).verify(happenedOnce);
    });
    test('Loop.end() calls Runner.stop()',() {
      var mock = new MockRunner();
      var loop = new Loop(mock);
      loop.end();
      
      mock.getLogs(callsTo('stop')).verify(happenedOnce);
    });
    test('When the tic function is called all the callbacks gets runned',() {
      var mock = new MockRunner();
      var loop = new Loop(mock);
      var list = new List();
      
      createCallback(num) {
        return () => list.add(num);
      }
      
      loop.callbacks.add(createCallback(1));
      loop.callbacks.add(createCallback(2));
      loop.callbacks.add(createCallback(3));
      
      loop.start();
      var tic = mock.getLogs(callsTo('start')).first.args[0];
      tic();
      
      expect(list,[1,2,3]);
    });
  });
}

