import 'package:hasura_connect/hasura_connect.dart';
import 'package:whatsapp_flutter_web/src/app_repository.dart';
import 'package:whatsapp_flutter_web/src/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/app_page.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => AppRepository(i.get<HasuraConnect>(), i.bloc<AppBloc>())),
        Dependency((i) => HasuraConnect("https://test-hasura-connect.herokuapp.com/v1/graphql")),
      ];

  @override
  Widget get view => AppPage(); 

  static Inject get to => Inject<AppModule>.of();
}
