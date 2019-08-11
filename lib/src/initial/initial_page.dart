import 'package:flutter_web/material.dart';
import 'package:whatsapp_flutter_web/src/shared/models/user_model.dart';

import '../app_module.dart';
import '../app_bloc.dart';
import 'initial_module.dart';
import 'initial_bloc.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final bloc = InitialModule.to.bloc<InitialBloc>();
  final appBloc = AppModule.to.bloc<AppBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F9FA),
      alignment: Alignment.center,
      child: StreamBuilder<bool>(
        stream: bloc.loginOut,
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset("images/logo-color.png"),
              SizedBox(height: 15),
              StreamBuilder<UserModel>(
                  stream: appBloc.userController,
                  builder: (context, userSnapshot) {
                    return Offstage(
                      offstage: userSnapshot.hasData,
                      child: SizedBox(
                        width: 350,
                        child: TextField(
                          controller: bloc.emailTextController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            suffixIcon: (snapshot.data == false)
                                ? Container(
                                    padding: EdgeInsets.all(15),
                                    width: 10,
                                    height: 10,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : IconButton(
                                    icon: Icon(Icons.arrow_forward),
                                    onPressed: bloc.login,
                                  ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    );
                  }),
              if (snapshot.hasError)
                Text(
                  "Email inválido",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          );
        },
      ),
    );
  }
}
