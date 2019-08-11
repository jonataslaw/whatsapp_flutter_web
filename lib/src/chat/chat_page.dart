import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/chat/app_bar/app_bar_widget.dart';
import 'package:whatsapp_flutter_web/src/chat/chat_module.dart';
import 'package:whatsapp_flutter_web/src/chat/message/message_widget.dart';
import 'package:whatsapp_flutter_web/src/shared/mixins/after_layout_mixin.dart';

import 'chat_bloc.dart';
import 'input_box/input_box_widget.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final bloc = ChatModule.to.bloc<ChatBloc>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          AppBarWidget(),
          Expanded(
            child: MessagesWidget(),
          ),
          InputBoxWidget(),
        ],
      ),
    );
  }
}
