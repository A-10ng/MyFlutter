import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget {

  ButtonDemo({Key key}) : super(key: key);

  @override
  _ButtonDemoState createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ButtonDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("我是RaisedButton"),
                onPressed: (){
                  print("我是RaisedButton");
                },
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("我是RaisedButton Icon"),
                onPressed: (){
                  print("我是RaisedButton Icon");
                },
              ),
              FlatButton(
                child: Text("我是FlatButton"),
                onPressed: (() => print("我是FlatButton")),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text("FlatButton Icon"),
                onPressed: (){
                  print("FlatButton Icon");
                },
              ),
              OutlineButton(
                child: Text("我是OutlineButton"),
                onPressed: (() => print("我是OutlineButton")),
              ),
              OutlineButton.icon(
                icon: Icon(Icons.save),
                label: Text("OutlineButton Icon"),
                onPressed: (){
                  print("OutlineButton Icon");
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: (() => print("我是IconButton")),
              ),
            ],
          ),
        )
    );
  }

}
