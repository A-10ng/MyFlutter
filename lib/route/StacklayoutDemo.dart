import 'package:flutter/material.dart';

class StacklayoutDemo extends StatefulWidget {
  StacklayoutDemo({Key key}) : super(key: key);

  @override
  _StacklayoutDemoState createState() => _StacklayoutDemoState();
}

class _StacklayoutDemoState extends State<StacklayoutDemo> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (double x = 10, y = 10; x < 100; x += 10, y += 10) {
      var widget = Positioned(
        child: Image.asset(
          "images/pai.png",
          width: 50,
        ),
        left: x,
        top: y,
      );
      list.add(widget);
    }
    for (double x = 100, y = 100; x < 200; x += 10, y -= 10) {
      var widget = Positioned(
        child: Image.asset(
          "images/pai.png",
          width: 50,
        ),
        left: x,
        top: y,
      );
      list.add(widget);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("StacklayoutDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.green,
                child: Stack(
                  alignment: Alignment.center,
                  children: list,
                ),
              ),
            ],
          ),
        ));
  }
}
