import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';

import 'home_page.dart';
import 'home_bloc.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
