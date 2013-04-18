library techtomb_test;

import 'package:unittest/vm_config.dart';
import 'package:unittest/unittest.dart';

import 'gamelib/gamelib.dart' as Gamelib;
main() {
  useVMConfiguration();
  
  Gamelib.main();
}
