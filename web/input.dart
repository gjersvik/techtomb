library input;

import 'dart:html';
import 'package:gamelib/game.dart';

typedef void TakeActions(List<Map<String, dynamic>> state);

class Input{
  Element element;
  TakeActions _takeActions;
  Actions actions;

  Input(String selector): actions = new Actions(){
    element = query(selector);
    AnalogAction pad = actions.add(new AnalogAction('PadPosition'));

    element.onMouseMove.listen((e){
      pad.value = e.clientX / element.clientWidth;
      _sendActions();
    });
  }

  pushActions(TakeActions callback) => _takeActions = callback;

  _sendActions() {
    var list = actions.data;
    if(list.isEmpty){
      return;
    }
    actions.reset();
    _takeActions(list);
  }
}
