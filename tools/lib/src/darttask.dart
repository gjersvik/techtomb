part of tools;

class DartTask extends Task{
  Path _script;

  DartTask(String name, Path script):super(name){
    if(script.isAbsolute){
      _script = script;
    }else{
      _script = new Path(new Directory.current().path).join(script);
    }
  }

  void setup(_){

  }

  Future<int> run(ArgResults results){
    var exit_code = new Completer<int>();
    var args = ['--checked',_script.toNativePath()];
    args.addAll(results.rest);
    var pro_options = new ProcessOptions();
    pro_options.workingDirectory = _script.directoryPath.toNativePath();

    Process.start(new Options().executable, args, pro_options).then((Process pro){
      pro.stdin.writeStream(stdin);
      stderr.writeStream(pro.stderr);
      stdout.writeStream(pro.stdout);
      pro.exitCode.then(
              (code)=> exit_code.complete(code),
              onError: (error) => exit_code.completeError(error)
      );
    });

    return exit_code.future;
  }
}
