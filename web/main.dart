import 'render.dart';
import 'game.dart';

void main() {
  var render = new Render('#htmlblocks');
  var game = new Game();
  
  game.postState(render.addState);
  
  game.start();
  render.start();
}

