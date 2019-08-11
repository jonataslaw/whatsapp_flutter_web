import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/app_repository.dart';

class InputBoxBloc extends BlocBase {
  final AppRepository repository;
  var textController = TextEditingController();

  InputBoxBloc(this.repository);

  void sendMessage(){
    repository.sendMessage(textController.text);
    textController.clear();
  }
  
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
