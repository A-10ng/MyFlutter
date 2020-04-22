import 'package:flutter/material.dart';

class IndicatorDemo extends StatefulWidget {
  IndicatorDemo({Key key}) : super(key: key);

  @override
  _IndicatorDemoState createState() => _IndicatorDemoState();
}

class _IndicatorDemoState extends State<IndicatorDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndicatorDemo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            //模糊进度条，会执行一个动画
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.yellow),
              value: 0.3,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 20,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.green),
              value: 0.5,
              strokeWidth: 30.0,
            ),
            SizedBox(
              height: 20,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.brown),
              ),
            ),
            SizedBox(
              height: 100,
              width: 600,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
                strokeWidth: 15,
              ),
            ),
            ProgressRoute(),
          ],
        ),
      ),
    );
  }
}

class ProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProgressRouteSate();
  }
}

class ProgressRouteSate extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LinearProgressIndicator(
      backgroundColor: Colors.grey[200],
      valueColor: ColorTween(begin: Colors.yellowAccent, end: Colors.black)
          .animate(_animationController),
      value: _animationController.value,
    );
  }
}
