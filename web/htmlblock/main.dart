library techtomb_htmlblock;

import 'dart:html';
import 'dart:math' as Math;

import 'package:box2d/box2d.dart';
import 'package:techtomb/gamelib_html.dart';

part 'src/ball.dart';
part 'src/block.dart';
part 'src/body_object.dart';
part 'src/body_objects.dart';
part 'src/collision.dart';
part 'src/game.dart';
part 'src/input.dart';
part 'src/pad.dart';
part 'src/render.dart';

void main() {
  var input = new Input('#htmlblocks');
  var game = new Game();
  var render = new Render('#htmlblocks');

  input.pushActions(game.addActions);
  game.postState(render.addState);

  game.start();
  render.start();
}

