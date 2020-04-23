import 'package:flutter/material.dart';

class TestSpecialDemo extends StatefulWidget {

  TestSpecialDemo({Key key}) : super(key: key);

  @override
  _TestSpecialDemoState createState() => _TestSpecialDemoState();
}

class _TestSpecialDemoState extends State<TestSpecialDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TestSpecialDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset("images/xuexiao.png",width: 50),
//              Image(
//                  image: AssetImage("images/pai.png"),
//                  width: 50.0,
//              ),
              Image(
                image: NetworkImage("http://longsh1z.top/resources/avatar.jpg"),
                width: 100.0,
              ),
              Wrap(
                children: <Widget>[
                  Image(
                    image: AssetImage("images/pai.png"),
                    width: 100.0,
                  ),
                  Image(
                    image: AssetImage("images/pai.png"),
                    width: 100.0,
                  ),
                  Image(
                    image: AssetImage("images/pai.png"),
                    width: 100.0,
                  ),
                  Image(
                    image: AssetImage("images/pai.png"),
                    width: 100.0,
                  ),
                ],
              ),

            ],
          ),
        )
    );
  }
}
