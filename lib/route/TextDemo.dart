import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("我是title"),
        titleSpacing: 3.0,
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          inherit: false,
            color: Colors.teal,
            fontSize: 20.0
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Hello World",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text(
              "Hello World" * 4,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              "Hello World",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.black,
                inherit: true
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Home:  "
                ),
                TextSpan(
                  text: "https:flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue
                  ),
//                  recognizer: _tapRecognizer
                )
              ]
            )),
          ],
        ),
      ),
    );
  }
}
