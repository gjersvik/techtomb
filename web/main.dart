import 'dart:html';
import 'dart:math';

import 'package:game_loop/game_loop.dart';

resize(game){
  var h = window.innerHeight;
  var w = window.innerWidth;
  var m = min(h,w);
  CanvasElement c = query('#htmlblocks');
  
  c.height = m;
  c.width = m;
}

void main() {
  var gameLoop = new GameLoop(query('#htmlblocks'));
  
  gameLoop.onResize = resize;
  
  gameLoop.start();
}

