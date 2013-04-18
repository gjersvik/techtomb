part of techtomb_gamelib_test;

class MockRunner extends Mock.Mock implements Runner{}

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
      _tic = mock.getLogs(Mock.callsTo('start')).last.args[0];
    }
    _tic();
  }
}

testLoop(){
  group('Loop:',() {
    test('Loop.start() calls Runner.start() wit a tic function',() {
      var test = new LoopTestData();
      test.loop.start();

      test.mock.getLogs(Mock.callsTo('start', new isInstanceOf<Function>())).verify(Mock.happenedOnce);
    });
    test('Loop.end() calls Runner.stop()',() {
      var test = new LoopTestData();
      test.loop.end();

      test.mock.getLogs(Mock.callsTo('stop')).verify(Mock.happenedOnce);
    });
    test('Loop.pause() calls Runner.stop()',() {
      var test = new LoopTestData();
      test.loop.pause();

      test.mock.getLogs(Mock.callsTo('stop')).verify(Mock.happenedOnce);
    });
    test('When the tic function is called all the callbacks gets runned',() {
      var test = new LoopTestData();
      var list = new List();

      createCallback(num) {
        return (_) => list.add(num);
      }

      test.loop[1].listen(createCallback(3));
      test.loop[0].listen(createCallback(2));
      test.loop[-1].listen(createCallback(1));

      test.loop.start();
      test.tic();

      expect(list,[1,2,3]);
    });

    test('Loop event data propecate thru the loop',() {
      var test = new LoopTestData();

      test.loop[0].listen((e) => e['testdata'] = 'somevalue');
      test.loop[0].listen((e) => expect(e['testdata'],'somevalue'));

      test.loop.start();
      test.tic();
    });
    test('Loop event[ticCount] increase by one every loop',() {
      var test = new LoopTestData();
      var count = null;

      test.loop[0].listen((e) => count = e['ticCount']);

      test.loop.start();
      test.tic();
      expect(count, 1);
      test.tic();
      expect(count, 2);
      test.tic();
      expect(count, 3);
    });
    test('end() reset count',() {
      var test = new LoopTestData();
      var count = null;
      test.loop[0].listen((e) => count = e['ticCount']);

      test.loop.start();
      test.tic();
      test.tic();
      test.loop.end();

      test.loop.start();
      test.tic();

      expect(count, 1);
    });
    test('pause() dont reset count',() {
      var test = new LoopTestData();
      var count = null;
      test.loop[0].listen((e) => count = e['ticCount']);

      test.loop.start();
      test.tic();
      test.tic();
      test.loop.pause();

      test.loop.start();
      test.tic();
      expect(count, 3);
    });
  });
}

