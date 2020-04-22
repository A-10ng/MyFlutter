import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {

  CheckboxDemo({Key key}) : super(key: key);

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {

  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CheckboxDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Switch(
                value: _switchSelected,
                onChanged: (value){
                  setState(() {
                    _switchSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,//选中时的颜色
                onChanged: (valu){
                  setState(() {
                    _checkboxSelected = valu;
                  });
                },
              )
            ],
          ),
        )
    );
  }
}
