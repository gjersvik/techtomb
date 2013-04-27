import 'dart:io';
import 'package:fukiya/fukiya.dart';

main(){
  var midleware = new Fukiya();
  midleware.get('/', (FukiyaContext context) {
    context.send('Testing');
  });
  midleware.listen('0.0.0.0', 8080);
}