part of techtomb_gamelib_test;

testNamedObject(){
  group('NamedObject:',() {
    test('have a name.',() {
      var object = new NamedObject('Testname');
      expect(object.name, 'Testname');
    });
  });
}


