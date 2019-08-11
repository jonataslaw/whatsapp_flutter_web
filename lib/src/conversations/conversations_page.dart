import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/conversations/conversations_list/conversations_list_widget.dart';
import 'package:whatsapp_flutter_web/src/conversations/findbar/findbar_widget.dart';

import 'appbar/appbar_widget.dart';

class ConversationsPage extends StatefulWidget {
  @override
  _ConversationsPageState createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF8F8F8),
      child: Column(
        children: <Widget>[
          AppbarWidget(),
          FindbarWidget(),
          Expanded(child: ConversationsListWidget()),
        ],
      ),
    );
  }
}
