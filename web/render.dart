library render;

import 'painter.dart';

import 'dart:html';
import 'dart:math';

import 'package:gamelib/loop.dart';
import 'package:gamelib/loop/animation_runner.dart';

class Render{
  CanvasElement element;
  CanvasRenderingContext2D context;
  Loop loop;
  
  Map _state = {};
  
  Render(tag):
    loop = new Loop(new AnimationRunner()){
    var size = min(window.innerHeight,window.innerWidth);
    element = query(tag);
    context = element.getContext('2d');
    
    element.height = size;
    element.width = size;
    
    context.scale(size / 100, size / 100);
    
    loop.callbacks.add((event){
      context.clearRect(0, 0, 100, 100);
      paint(context, _state);
    });
  }
  
  start() => loop.start();
  
  addState(num gametime, Map state) => _state = state;
}