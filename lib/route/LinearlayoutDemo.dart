import 'package:flutter/material.dart';

class LinearlayoutDemo extends StatefulWidget {

  LinearlayoutDemo({Key key}) : super(key: key);

  @override
  _LinearlayoutDemoState createState() => _LinearlayoutDemoState();
}

class _LinearlayoutDemoState extends State<LinearlayoutDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LinearlayoutDemo"),
        ),
        body: Center(
          child: Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("hello"),
                  Text("jack"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("hello"),
                  Text("jack"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("hello"),
                  Text("jack"),
                ],
              ),
              Row(
                verticalDirection: VerticalDirection.up,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(" hello ",style: TextStyle(fontSize: 30.0),),
                  Text(" jack "),
                ],
              ),
            ],
          ),
        )
    );
  }
}
