part of gamelib_share;

class ButtonAction extends Action{
  ButtonAction(name):super(name,'button');

  bool get value => changed;
  set value(value) => changed = value;
}
