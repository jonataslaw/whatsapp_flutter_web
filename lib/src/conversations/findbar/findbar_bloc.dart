import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';

class FindbarBloc extends BlocBase {
  var focusNode = FocusNode();
  
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }
}
