import 'package:flutter_web/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        color: Color(0XFFefefef),
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]),
          left: BorderSide(color: Colors.grey[300]),
        ),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).dividerColor,
              backgroundImage: NetworkImage(
                "https://flutterando.com.br/wp-content/uploads/2019/06/flutterando_logo.png",
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Flutterando Chat", style: TextStyle(fontSize: 16)),
              Container(height: 5),
              Text(
                "Online",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: () {},
            color: Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
            color: Colors.grey,
          ),
          Container(
            width: 20,
          )
        ],
      ),
    );
  }
}
