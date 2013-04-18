part of techtomb_gamelib_test;

testNubAction(){
  group('NubAction:',() {
    test('is of type nub.',() {
      var action = new NubAction('TestAction1');
      expect(action.type, 'nub');
    });
    test('value starts as 0.',() {
      var action = new NubAction('TestAction1');
      expect(action.value, 0);
    });
  });
}
