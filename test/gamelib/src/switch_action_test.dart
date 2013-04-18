part of techtomb_gamelib_test;

testSwitchAction(){
  group('SwitchAction:',() {
    test('is of type switch.',() {
      var action = new SwitchAction('TestAction1');
      expect(action.type, 'switch');
    });
    test('value starts as false.',() {
      var action = new SwitchAction('TestAction1');
      expect(action.value, false);
    });
  });
}


