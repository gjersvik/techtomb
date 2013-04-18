library timeline_test;

import 'package:unittest/unittest.dart';
import 'package:techtomb/render.dart';

main(){
  group('Timeline:',() {
    test('will remove first of you put more than size.',() {
      var timeline = new Timeline(1);
      timeline.add(1, {'name': 'remove me'});
      timeline.add(2, {'name': 'keep me'});

      expect(timeline.get(0), {'name': 'keep me'});
    });
    test('if empty return empty map',() {
      var timeline = new Timeline(10);

      expect(timeline.get(0), {});
    });
    test('return first if time is before first.',() {
      var timeline = new Timeline(10);
      timeline.add(1, {'name': 'first'});
      timeline.add(2, {'name': 'last'});

      expect(timeline.get(0), {'name': 'first'});
    });
    test('return last if time is after last.',() {
      var timeline = new Timeline(10);
      timeline.add(1, {'name': 'first'});
      timeline.add(2, {'name': 'last'});

      expect(timeline.get(3), {'name': 'last'});
    });
    test('if excact matsh return that.',() {
      var timeline = new Timeline(10);
      timeline.add(1, {'name': 'first'});
      timeline.add(2, {'name': 'middle'});
      timeline.add(3, {'name': 'last'});

      expect(timeline.get(2), {'name': 'middle'});
    });
    test('interpolate numbers.',() {
      var timeline = new Timeline(10);
      timeline.add(1, {'number': 1});
      timeline.add(2, {'number': 2});
      timeline.add(3, {'number': 3});

      expect(timeline.get(2.75), {'number': 2.75});
    });
  });
}
