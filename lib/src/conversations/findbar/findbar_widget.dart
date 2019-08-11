import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/conversations/conversations_module.dart';
import 'package:whatsapp_flutter_web/src/conversations/findbar/icon_widget.dart';

import 'findbar_bloc.dart';

class FindbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = ConversationsModule.to.bloc<FindbarBloc>();

    return AnimatedBuilder(
      animation: bloc.focusNode,
      builder: (context, child) {
        return AnimatedContainer(
          child: child,
          height: 49,
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.fromLTRB(12, 7, 14, 7),
          margin: EdgeInsets.only(bottom: bloc.focusNode.hasFocus ? 5 : 0),
          decoration: BoxDecoration(
            color: bloc.focusNode.hasFocus ? Colors.white : Color(0xFFF8F8F8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: bloc.focusNode.hasFocus ? 4 : 0,
              ),
            ],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(0, -3),
              child: TextField(
                focusNode: bloc.focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search or start new chat",
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            IconWidget(),
          ],
        ),
      ),
    );
  }
}
