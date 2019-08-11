import 'package:whatsapp_flutter_web/src/app_module.dart';
import 'package:whatsapp_flutter_web/src/initial/initial_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/initial/initial_page.dart';

import '../app_repository.dart';

class InitialModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InitialBloc(AppModule.to.get<AppRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InitialPage();

  static Inject get to => Inject<InitialModule>.of();
}
