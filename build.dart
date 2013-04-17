import 'dart:io';
import 'dart:async';

Path dart_sdk = new Path(new Options().executable).directoryPath;

Future<int> run(exec, args, working_dir){
  var completer = new Completer();

  var options = new ProcessOptions();
  options.workingDirectory = working_dir;

  exec = dart_sdk.append(exec).toNativePath();

  Process.start(exec, args, options).then((Process pro){
    pro.stdin.close();
    stderr.addStream(pro.stderr);
    stdout.addStream(pro.stdout);
    pro.exitCode.then((code) => completer.complete(code));
  });

  return completer.future;
}

Future pub(){
  var completer = new Completer();
  var dir = new Directory('tools/packages');
  dir.exists().then((exits) {
    if(exits){
      completer.complete();
    } else {
      run('pub.bat',['install'],new Directory('tools').path).then((code) => code == 0 ? completer.complete() : completer.completeError('pub error'));
    }
  });

  return completer.future;
}

void tools(_){
  var args  = ['--checked','tools/bin/build.dart'];
  args.addAll(new Options().arguments);

  run('dart', args, new Directory.current().path).then((code)=>exit(code));
}

main(){
  pub().then(tools);
}