library test.loop;

import 'package:unittest/unittest.dart';
import 'package:unittest/mock.dart';
import 'package:gamelib/loop.dart';

class MockRunner extends Mock implements Runner{}

class LoopTestData{
  Loop loop;
  MockRunner mock;
  Function _tic = null;
  
  LoopTestData() {
    mock = new MockRunner();
    loop = new Loop(mock);
  }
  
  tic() {
    if(_tic == null) {
      _tic = mock.getLogs(callsTo('start')).last.args[0];
    }
    _tic();
  }
}

main(){
  group('Loop:',() {
    test('Loop.start() calls Runner.start() wit a tic function',() {
      var test = new LoopTestData();
      test.loop.start();
      
      test.mock.getLogs(callsTo('start', new isInstanceOf<Function>())).verify(happenedOnce);
    });
    test('Loop.end() calls Runner.stop()',() {
      var test = new LoopTestData();
      test.loop.end();
      
      test.mock.getLogs(callsTo('stop')).verify(happenedOnce);
    });
    test('When the tic function is called all the callbacks gets runned',() {
      var test = new LoopTestData();
      var list = new List();
      
      createCallback(num) {
        return (_) => list.add(num);
      }
      
      test.loop.callbacks.add(createCallback(1));
      test.loop.callbacks.add(createCallback(2));
      test.loop.callbacks.add(createCallback(3));
      
      test.loop.start();
      test.tic();
      
      expect(list,[1,2,3]);
    });

    test('Loop event data propecate thru the loop',() {
      var test = new LoopTestData();
      
      test.loop.callbacks.add((e) => e['testdata'] = 'somevalue');
      test.loop.callbacks.add((e) => expect(e['testdata'],'somevalue'));
      
      test.loop.start();
      test.tic();
    });
  });
}

