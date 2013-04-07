library build;

import 'dart:io';
import 'package:dart_config/default_server.dart';

void main(){
  var options = new Options();
  print(options.arguments);
  print(options.executable);
  print(options.script);
  print(new Directory.current().path);

  loadConfig().then((conf) {
    print(conf['dartsdk']);
  });
}