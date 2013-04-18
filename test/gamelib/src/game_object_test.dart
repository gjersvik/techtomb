part of techtomb_gamelib_test;

testGameObject(){
  group('GameObject:',() {
    test('name from constructor.',() {
      var object = new GameObject('TestName','TestType');
      expect(object.name, 'TestName');
    });
    test('type from constructor.',() {
      var object = new GameObject('TestName','TestType');
      expect(object.type, 'TestType');
    });
    test('toGameState returns type info',() {
      var object = new GameObject('TestName','TestType');
      expect(object.toGameState(), {'type':'TestType'});
    });
    test('fire test event',() {
      var object = new GameObject('TestName','TestType');
      var listen = false;
      object.on.listen((_)=> listen = true);
      object.fire('testevent');
      expect(listen, isTrue);
    });
    test('GameEvent has name data and object',() {
      var object = new GameObject('TestName','TestType');
      GameEvent event;
      object.on.listen((e)=> event = e);
      object.fire('testevent','testdata');
      expect(event.name, 'testevent');
      expect(event.data, 'testdata');
      expect(event.object, object);
    });
    test('destroy send destroying event',() {
      var object = new GameObject('TestName','TestType');
      GameEvent event;
      object.on.listen((e)=> event = e);
      object.destroy();
      expect(event.name, 'destroying');
    });
    test('destroy closes stream',() {
      var object = new GameObject('TestName','TestType');
      var done = false;
      object.on.listen(null,onDone: ()=> done = true);
      object.destroy();
      expect(done, isTrue);
    });
  });
}