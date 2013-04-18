part of techtomb_gamelib_test;

testButtonAction(){
  group('ButtonAction:',() {
    test('is of type button.',() {
      var action = new ButtonAction('TestAction1');
      expect(action.type, 'button');
    });
    test('value starts as false',() {
      var action = new ButtonAction('TestAction1');
      expect(action.value, false);
    });
    test('value is the same as changed',() {
      var action = new ButtonAction('TestAction1');
      action.value = true;
      expect(action.changed, true);
      action.value = false;
      expect(action.changed, false);
    });
  });
}
