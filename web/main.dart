import 'dart:html';

import 'package:game_loop/game_loop.dart';

resize(game){
  print('resize');
}

void main() {
  var gameLoop = new GameLoop(query('#htmlblocks'));
  
  gameLoop.onResize = resize;
  
  gameLoop.start();
}

