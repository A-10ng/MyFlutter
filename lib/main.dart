import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'route/homeroute.dart';
import 'route/ParentWidget.dart';
import 'route/ParentWidgetC.dart';
import 'route/TextDemo.dart';
import 'route/ButtonDemo.dart';
import 'route/ImageDemo.dart';
import 'route/CheckboxDemo.dart';
import 'route/TextFieldAndFormDemo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //注册路由表
//      routes: {
//        "new_route": (context) => NewRoute(),
//        "tip_route": (context) {
//          return TipRoute(text: ModalRoute.of(context).settings.arguments);
//        },
//        "route_test": (context) => RouterTestRoute(),
//        "echo_route": (context) => EchoRoute(),
//        "/": (context) => MyHomePage(
//              title: 'Flutter Demo Home Page',
//            )
//      },
//      initialRoute: "/",
      routes: {},
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          if (routeName == "new_route") {
            return NewRoute();
          } else {
            return RouterTestRoute();
          }
        });
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  // Column is also a layout widget. It takes a list of children and
                  // arranges them vertically. By default, it sizes itself to fit its
                  // children horizontally, and tries to be as tall as its parent.
                  //
                  // Invoke "debug painting" (press "p" in the console, choose the
                  // "Toggle Debug Paint" action from the Flutter Inspector in Android
                  // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                  // to see the wireframe for each widget.
                  //
                  // Column has various properties to control how it sizes itself and
                  // how it positions its children. Here we use mainAxisAlignment to
                  // center the children vertically; the main axis here is the vertical
                  // axis because Columns are vertical (the cross axis would be
                  // horizontal).
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("包管理：引入第三方包"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return RandomWidget();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("路由传值"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return RouterTestRoute();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("Widget管理自身状态"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HomeRoute();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("父Widget管理子Widget自身状态"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ParentWidget();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("混合状态管理"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ParentWidgetC();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("文   本"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return TextDemo();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("按   钮"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ButtonDemo();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("图片"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return ImageDemo();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("单选框和复选框"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CheckboxDemo();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    RaisedButton(
                      child: Text("输入框及表单"),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return TextFieldAndFormDemo();
                        }));
                      },
                      color: Colors.blue,
                      highlightColor: Colors.blue[700],
                      colorBrightness: Brightness.dark,
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ],
                ),
              ),
            ),)
        ),
    );// This trailing comma makes auto-formatting nicer for build methods.
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var randomStr = new WordPair.random();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(randomStr.toString()),
          ],
        ),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, //接受一个text参数
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(text),
                RaisedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: Text("返回"),
                )
              ],
            ),
          )),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              //打开TipRoute,并等待返回结果
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(
                      //路由参数
                      text: "我是提示xxxx",
                    );
                  }));
              //输出TipRoute路由的返回结果
              print("路由返回值：$result");
            },
            child: Text("打开提示页"),
          ),
        )
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("我是标题"),
      ),
      body: Center(
        child: Text("我是body"),
      ),
    );
  }
}

class RandomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var randomStr = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              randomStr.toString(),
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
