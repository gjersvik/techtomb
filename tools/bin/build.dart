library build;

import 'dart:io';
import 'dart:async';
import 'package:tools/tools.dart';
import 'package:args/args.dart';
//import 'package:dart_config/default_server.dart';

void main(){
  var server = new DartTask('server',new Path('site/server.dart'));
  var args = new ArgParser();
  server.setup(args.addCommand(server.name));

  var result = args.parse(new Options().arguments);
  if(result.command != null && result.command.name == server.name){
    server.run(result.command).then((code)=>exit(code));
  }
}