import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/shared/models/message_model.dart';
import 'package:whatsapp_flutter_web/src/shared/models/user_model.dart';

import 'package:whatsapp_flutter_web/src/shared/widgets/custom_appbar/custom_scrollbar_widget.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';
import '../chat_bloc.dart';
import '../chat_module.dart';
import '../message_blob/message_blob_component.dart';
import 'message_bloc.dart';

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ChatModule.to.bloc<MessageBloc>();
    final chatBloc = ChatModule.to.bloc<ChatBloc>();
    final appBloc = AppModule.to.bloc<AppBloc>();

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Color(0xFFE5DDD5),
          child: Opacity(
            opacity: 0.07,
            child: Image.asset(
              "images/background-chat.png",
              fit: BoxFit.contain,
              repeat: ImageRepeat.repeat,
            ),
          ),
        ),
        StreamBuilder<List<MessageModel>>(
          stream: bloc.messagesOut,
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            else {
              // chatBloc.scrollController.position.moveTo(
              //   chatBloc.scrollController.position.maxScrollExtent,
              // );

              // return CustomScrollbarWidget(
              //   controller: chatBloc.scrollController,
              //   child:
              return ListView.separated(
                reverse: true,
                controller: bloc.scrollController,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                itemCount: snapshot.data.length + 1,
                separatorBuilder: (context, index) => Container(height: 10),
                itemBuilder: (context, index) {
                  if (index == snapshot.data.length)
                    return StreamBuilder<bool>(
                      stream: bloc.moreController,
                      builder: (context, snapshot) {
                        return snapshot.data ?? true
                            ? Center(
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  margin: EdgeInsets.all(15),
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Container();
                      },
                    );
                  else
                    return MessageBlobComponent(
                      message: snapshot.data[index],
                      me: snapshot.data[index].user.id ==
                          appBloc.userController.value.id,
                    );
                },
                // ),
              );
            }
          },
        ),
      ],
    );
  }
}
