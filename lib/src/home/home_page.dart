import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/chat/chat_module.dart';
import 'package:whatsapp_flutter_web/src/initial/initial_module.dart';

import '../app_bloc.dart';
import '../app_module.dart';
import '../conversations/conversations_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppModule.to.bloc<AppBloc>();
    return Material(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(child: Container(color: Color(0xFF009688))),
              Expanded(flex: 6, child: Container(color: Color(0xFFdfdfdf))),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1400, maxHeight: 920),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4),
                    ]),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: ConversationsModule(),
                    ),
                    Expanded(
                      flex: 7,
                      child: StreamBuilder<bool>(
                        stream: appBloc.selectedRoomController,
                        builder: (context, snapshot) {
                          bool isSelected = snapshot.data ?? false;
                          if (!isSelected) return InitialModule();
                          return ChatModule();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
