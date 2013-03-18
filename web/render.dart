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

    e['gamestate'].forEach((key, value){
      if(value['type'] == 'ball'){
        _paintBall(value);
      }
      if(value['type'] == 'pad'){
        _paintPad(value);
      }
    });
  }

  void _paintBall(Map ball){
    context.fillStyle = 'yellow';
    context.beginPath();
    context.arc(ball['x'], ball['y'], ball['size'], 0, PI*2, false);
    context.fill();
  }

  void _paintPad(Map pad){
    var x = pad['x'];
    var y = pad['y'];
    var h = pad['height'];
    var w = pad['width'];

    context.fillStyle = 'red';
    context.fillRect(
        x - (w - h) / 2,
        y - h / 2,
        w - h,
        h);
    context.beginPath();
    context.arc(x - (w - h) / 2, y, h / 2, 0, PI*2, false);
    context.arc(x + (w - h) / 2, y, h / 2, 0, PI*2, false);
    context.fill();

  }
}
