import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:rxdart/rxdart.dart';

import '../app_bloc.dart';
import '../app_module.dart';
import '../app_repository.dart';

class InitialBloc extends BlocBase {

  final AppRepository _repository;

  InitialBloc(this._repository);

  var emailTextController = TextEditingController();
  var loadingController = BehaviorSubject.seeded(false);
  var appBloc = AppModule.to.bloc<AppBloc>();

  var loginController = BehaviorSubject<bool>();
  void login() => loginController.add(true);
  void logout() => appBloc.userController.add(null);
  Stream<bool> get loginOut =>
      loginController
        .where((val) => val != null)
        .map((_) => loginController.add(null))
        .switchMap(loginFlux);

  Stream<bool> loginFlux(_) async* {
    try {
      yield false;
      appBloc.userController.add(await _repository.login(emailTextController.text));
      yield true;
    }catch(ex){
      yield* Observable.error(ex);
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    emailTextController.dispose();
    loadingController.close();
    loginController.close();
    super.dispose();
  }
}
