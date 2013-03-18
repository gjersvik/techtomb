library input;

import 'dart:html';
import 'package:gamelib/input.dart';

typedef void TakeActions(Map<String, dynamic> state);

class Input{
  Element element;
  TakeActions _takeActions;
  InputActions actions;

  Input(String selector): actions = new InputActions(){
    element = query(selector);
    NubAction pad = actions.add(new NubAction('PadPosition'));

    element.onMouseMove.listen((e){
      pad.value = e.clientX / element.clientWidth;
      _sendActions();
    });
  }

  pushActions(TakeActions callback) => _takeActions = callback;

  _sendActions() {
    _takeActions(actions.toMap());
    actions.reset();
  }
}
