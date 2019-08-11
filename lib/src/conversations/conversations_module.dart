import 'package:whatsapp_flutter_web/src/conversations/findbar/findbar_bloc.dart';
import 'package:whatsapp_flutter_web/src/conversations/conversations_list/conversations_list_bloc.dart';
import 'package:whatsapp_flutter_web/src/conversations/appbar/appbar_bloc.dart';
import 'package:whatsapp_flutter_web/src/conversations/conversations_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/conversations/conversations_page.dart';

class ConversationsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => FindbarBloc()),
        Bloc((i) => ConversationsListBloc()),
        Bloc((i) => AppbarBloc()),
        Bloc((i) => ConversationsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => ConversationsPage();

  static Inject get to => Inject<ConversationsModule>.of();
}
