import 'package:whatsapp_flutter_web/src/app_module.dart';
import 'package:whatsapp_flutter_web/src/chat/input_box/input_box_bloc.dart';
import 'package:whatsapp_flutter_web/src/chat/message/message_bloc.dart';
import 'package:whatsapp_flutter_web/src/chat/app_bar/app_bar_bloc.dart';
import 'package:whatsapp_flutter_web/src/chat/chat_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/chat/chat_page.dart';

import '../app_bloc.dart';
import '../app_repository.dart';

class ChatModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InputBoxBloc(AppModule.to.get<AppRepository>())),
        Bloc(
          (i) => MessageBloc(
            AppModule.to.get<AppRepository>(),
            AppModule.to.bloc<AppBloc>(),
          ),
        ),
        Bloc((i) => AppBarBloc()),
        Bloc((i) => ChatBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ChatPage();

  static Inject get to => Inject<ChatModule>.of();
}
