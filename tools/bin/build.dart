library build;
import 'package:dart_config/default_server.dart';

void main(){
  loadConfig().then((conf) {
    print(conf['dartsdk']);
  });
}