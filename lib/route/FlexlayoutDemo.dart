import 'package:flutter/material.dart';

class FlexlayoutDemo extends StatefulWidget {

  FlexlayoutDemo({Key key}) : super(key: key);

  @override
  _FlexlayoutDemoState createState() => _FlexlayoutDemoState();
}

class _FlexlayoutDemoState extends State<FlexlayoutDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlexlayoutDemo"),
        ),
        body: Column(
          children: <Widget>[
            //Flex的两个子widget按1:2来占据水平空间
            Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  ),
                ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                height: 100.0,
                child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 100.0,
                          color: Colors.red,
                        ),
                      ),
                      Spacer(flex: 1,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 30.0,
                          color: Colors.green,
                        ),
                      ),
                    ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
