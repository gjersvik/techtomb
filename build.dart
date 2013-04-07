import 'dart:io';
//import 'tools/bin/build.dart' as build;

main(){
  var options = new Options();
  var args  = [];
  args.add('tools/bin/build.dart');
  args.addAll(options.arguments);

  var prooptions = new ProcessOptions();
  prooptions.workingDirectory = new Directory.current().path;

  Process.start(options.executable, args).then(setupProcess);
}

setupProcess(Process pro){
  pro.stdin.writeStream(stdin);
  stderr.writeStream(pro.stderr);
  stdout.writeStream(pro.stdout);
  pro.exitCode.then((code)=> exit(code));
}