import 'package:flutter_web/material.dart';

import 'home/home_module.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerColor: Color(0xFFF2F2F2),
        fontFamily: "Roboto",
        appBarTheme: AppBarTheme(
          color: Color(0xFFEEEEEE),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
      home: HomeModule(),
    );
  }
}
