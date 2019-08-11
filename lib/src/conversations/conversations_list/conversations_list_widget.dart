import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/shared/models/user_model.dart';

import '../../app_bloc.dart';
import '../../app_module.dart';

class ConversationsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppModule.to.bloc<AppBloc>();

    return Container(
      color: Colors.white,
      child: StreamBuilder<UserModel>(
          stream: appBloc.userController,
          builder: (context, userSnapshot) {
            if (!userSnapshot.hasData)
              return ListTile(
                title: Text(
                  "Login to see conversations",
                  style: TextStyle(color: Colors.grey),
                ),
              );
            return ListView.separated(
              itemCount: 1,
              separatorBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 1,
                        margin: EdgeInsets.only(left: 70, right: 10),
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ],
                );
              },
              itemBuilder: (context, index) {
                return StreamBuilder<bool>(
                    stream: appBloc.selectedRoomController,
                    builder: (context, snapshot) {
                      bool isSelected = snapshot?.data ?? false;
                      return ListTile(
                        selected: isSelected,
                        leading: CircleAvatar(
                          backgroundColor: Colors
                              .transparent, //Theme.of(context).dividerColor,
                          backgroundImage: NetworkImage(
                              "https://flutterando.com.br/wp-content/uploads/2019/06/flutterando_logo.png"),
                        ),
                        title: Text("Flutterando Chat"),
                        subtitle: Text(
                          "Received message",
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text("18:34", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        onTap: () {
                          appBloc.selectedRoomController.add(true);
                        },
                      );
                    });
              },
            );
          }),
    );
  }
}
