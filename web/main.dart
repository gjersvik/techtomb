import 'dart:html';
import 'dart:math';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/loop/animation_runner.dart';

void main() {
  var gameloop = new Loop(new TimerRunner());
  var renderloop = new Loop(new AnimationRunner());
  
  gameloop.start();
  renderloop.start();
}

