part of techtomb_gamelib_test;

testAction(){
  group('Action:',() {
    test('have a type',() {
      var action = new Action('TestAction1','test');
      expect(action.type, 'test');
    });
    test('have a value',() {
      var action = new Action('TestAction1','test');
      action.value = 'some value';
      expect(action.value, 'some value');
    });
    test('set new value setts changed to true',() {
      var action = new Action('TestAction1','test');
      action.value = 'some value';
      expect(action.changed, true);
    });
    test('reset sets changed to false',() {
      var action = new Action('TestAction1','test');
      action.changed = true;
      action.reset();
      expect(action.changed, false);
    });
    test('set the same value as before do not tigger changed',() {
      var action = new Action('TestAction1','test');
      action.value = 'some value';
      action.reset();
      action.value = 'some value';
      expect(action.changed, false);
    });
  });
}
