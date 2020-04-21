import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class HomeRoute extends StatefulWidget {
  final int initValue;

  const HomeRoute({Key key, this.initValue: 0});

  @override
  _HomeRouteState createState() => new _HomeRouteState();

  void work() {
    print("working...");
  }
}

class _HomeRouteState extends State<HomeRoute> {
  int _counter;
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
//    return CupertinoPageScaffold(
//      key: scaffoldKey,
//      body: Center(
//        child: FlatButton(
//          child: Text('$_counter'),
//          //点击后计数器自增
//          onPressed: () {
//            scaffoldKey.currentState.showSnackBar(
//              SnackBar(content: Text("我是SnackBar!")),
//            );
//            setState(() {
//              ++_counter;
//            });
//          },
//        ),
//      ),
//      child: Center(
//        child: CupertinoButton(
//            color: CupertinoColors.activeBlue,
//            child: Text("Press"),
//            onPressed: () {}),
//      ),
    return new TapboxA();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

  @override
  void didUpdateWidget(HomeRoute oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }
}

class TapboxA extends StatefulWidget {
  @override
  _TapBoxAState createState() => new _TapBoxAState();

  TapboxA({Key key}) : super(key: key);
}

class _TapBoxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
//    Scaffold.of(context).showSnackBar(new SnackBar(content: Text("hahah")));
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
