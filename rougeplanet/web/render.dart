library render;

import 'dart:html';
import 'dart:math';

import 'package:gamelib/render_html.dart';

class Render{
  CanvasElement element;
  CanvasRenderingContext2D context;
  Loop loop;

  Timeline _state;

  Render(tag):
    loop = new Loop(new AnimationRunner()),
    _state = new Timeline(50){
    var size = min(window.innerHeight,window.innerWidth);
    element = query(tag);
    context = element.getContext('2d');

    element.height = size;
    element.width = size;

    context.scale(size / 100, size / 100);

    loop.callbacks.add((e){
      e['gametime'] -= 0.075;
      e['gamestate'] = _state.get(e['gametime']);
    });

    loop.callbacks.add(_paint);
  }

  start() => loop.start();

  addState(num time, Map state) => _state.add(time, state);

  void _paint(e){
    context.clearRect(0, 0, 100, 100);
    context.fillStyle = 'blue';
    context.beginPath();
    context.arc(50, 50, 15, 0, PI*2, false);
    context.fill();
    
    
  }
}
