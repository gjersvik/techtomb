library render;

import 'dart:html';
import 'dart:math';

import 'package:techtomb/gamelib_html.dart';

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

    loop[0].listen((e){
      e['gametime'] -= 0.075;
      e['gamestate'] = _state.get(e['gametime']);
    });

    loop[100].listen(_paint);
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
      if(value['type'] == 'block'){
        _paintBlock(value);
      }
      if(value['type'] == 'score'){
        print(value['score']);
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

  void _paintBlock(Map block){
    context.fillStyle = 'white';
    context.fillRect(block['x'] - block['width'] / 2 , block['y'] - block['height'] / 2, block['width'], block['height']);
  }
}
