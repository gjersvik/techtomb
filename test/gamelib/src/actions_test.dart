part of techtomb_gamelib_test;

testActions(){
  group('Actions:',() {
    test('reset() resets all.',() {
      var actions = new Actions();
      actions.add(new Action('TestAction1','test')..changed = true);

      actions.reset();

      expect(actions.objects['TestAction1'].changed, false);
    });
  });
}
