import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:whatsapp_flutter_web/src/shared/models/user_model.dart';

class AppBloc extends BlocBase {
  var selectedRoomController = BehaviorSubject.seeded(false);
  var userController = BehaviorSubject<UserModel>();
  // BehaviorSubject.seeded(
  //   UserModel(
  //     id: 1,
  //     name: "Deivao",
  //     email: "david@flutterando.com.br",
  //     picture: "https://media.licdn.com/dms/image/C5603AQEKYex09zfWlg/profile-displayphoto-shrink_100_100/0?e=1571270400&v=beta&t=Ycr0a9I7FfLS7gjaCsO415w504wuG_EBIQsXXlla4w0",
  //   ),
  // );

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
