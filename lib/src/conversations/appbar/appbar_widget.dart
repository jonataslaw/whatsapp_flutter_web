import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/app_module.dart';
import 'package:whatsapp_flutter_web/src/shared/models/user_model.dart';

import '../../app_bloc.dart';

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBloc = AppModule.to.bloc<AppBloc>();
    return Container(
      height: 59,
      color: Theme.of(context).appBarTheme.color,
      child: ListTile(
        leading: StreamBuilder<UserModel>(
          stream: appBloc.userController,
          builder: (context, userSnapshot) {
            return CircleAvatar(
              backgroundColor: Theme.of(context).dividerColor,
              backgroundImage: (userSnapshot.hasData)
                  ? NetworkImage(
                      userSnapshot.data.picture,
                    )
                  : null,
            );
          },
        ),
        trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
