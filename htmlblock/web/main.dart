import 'input.dart';
import 'game.dart';
import 'render.dart';

void main() {
  var input = new Input('#htmlblocks');
  var game = new Game();
  var render = new Render('#htmlblocks');

  input.pushActions(game.addActions);
  game.postState(render.addState);

  game.start();
  render.start();
}

