import 'dart:html';
import 'dart:math';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/timer_runner.dart';
import 'package:gamelib/loop/animation_runner.dart';

CanvasRenderingContext2D setupCanvas(){
  var size = min(window.innerHeight,window.innerWidth);
  CanvasElement c = query('#htmlblocks');
  CanvasRenderingContext2D paint = c.getContext('2d');
  
  c.height = size;
  c.width = size;
  
  paint.scale(size / 100, size / 100);
  
  return paint;
}

void main() {
  var gameloop = new Loop(new TimerRunner());
  var renderloop = new Loop(new AnimationRunner());
  var paint = setupCanvas();
  
  renderloop.callbacks.add((){
    paint.clearRect(0, 0, 100, 100);
    
    paint.strokeStyle = 'yellow';
    
    paint.strokeRect(1, 1, 98, 98, 2);
  });
  
  gameloop.start();
  renderloop.start();
}

