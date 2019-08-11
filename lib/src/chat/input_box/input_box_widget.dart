import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/chat/chat_module.dart';

import 'input_box_bloc.dart';

class InputBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ChatModule.to.bloc<InputBoxBloc>();

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 121.96),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFefefef),
          border: Border(
            top: BorderSide(color: Colors.grey[300]),
            left: BorderSide(color: Colors.grey[300]),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 57),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: TextField(
                          maxLines: null,
                          controller: bloc.textController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: -5,
                    child: IconButton(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      icon: Icon(Icons.sentiment_very_satisfied, size: 26),
                      onPressed: () {},
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: -5,
                    child: AnimatedBuilder(
                      animation: bloc.textController,
                      builder: (BuildContext context, Widget child) {
                        return (bloc.textController.text.isEmpty)
                            ? IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 19),
                                icon: Icon(
                                  Icons.mic,
                                  size: 26,
                                ),
                                onPressed: () {},
                                color: Colors.grey,
                              )
                            : IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 19),
                                icon: Icon(
                                  Icons.send,
                                  size: 26,
                                ),
                                onPressed: bloc.sendMessage,
                                color: Colors.grey,
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
