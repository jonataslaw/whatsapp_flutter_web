import 'package:flutter_web/material.dart';

import '../conversations_module.dart';
import 'findbar_bloc.dart';

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = ConversationsModule.to.bloc<FindbarBloc>();
    return AnimatedBuilder(
      animation: bloc.focusNode,
      builder: (context, child) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10),
          child: !bloc.focusNode.hasFocus
              ? Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 18,
                )
              : Material(
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                      size: 18,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
