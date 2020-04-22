import 'package:flutter/material.dart';

class TextFieldAndFormDemo extends StatefulWidget {
  TextFieldAndFormDemo({Key key}) : super(key: key);

  @override
  _TextFieldAndFormDemoState createState() => _TextFieldAndFormDemoState();
}

class _TextFieldAndFormDemoState extends State<TextFieldAndFormDemo> {
  //定义一个controller
  TextEditingController controller = TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
//    controller.text = "hello world";
//    controller.selection = TextSelection(
//        baseOffset: 2,
//        extentOffset: controller.text.length);
    controller.addListener(() {
      print("controller:" + controller.text);
    });

    focusNode1.addListener(() {
      print("focusNode1---${focusNode1.hasFocus}");
    });

    focusNode2.addListener(() {
      print("focusNode2---${focusNode2.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TextFieldAndFormDemo"),
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
                  TextField(
                    controller: controller,
                    //设置controller
                    autofocus: false,
                    focusNode: focusNode1,
                    //关联focusNode1
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)),
                    onChanged: (value) {
                      print("onChange: $value");
                    },
                  ),
                  TextField(
                    focusNode: focusNode2,
                    decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        prefixIcon: Icon(Icons.lock)),
                    obscureText: true,
                  ),
                  Builder(builder: (ctx) {
                    return Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text("移动焦点"),
                          onPressed: () {
                            //将焦点从第一个textfield移到第二个textfield
                            //第一种写法：FocusScope.of(context).requestFocus(focusNode2);
                            //第二种写法：
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusNode2);
                          },
                        ),
                        RaisedButton(
                          child: Text("隐藏键盘"),
                          onPressed: () {
                            //当所有编辑框都失去焦点时键盘就会收起
                            focusNode1.unfocus();
                            focusNode2.unfocus();
                          },
                        ),
                      ],
                    );
                  }),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "自定义输入框下划线",
                        prefixIcon: Icon(Icons.accessibility_new),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        //获得焦点下划线设为蓝色
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )),
                  ),
                  Text("\n\n\n\n\n\n"),
                  FormTestRoute(),
                ],
              ),
            ),
          ),
        )));
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new FormTestRouteState();
  }
}

class FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _globalKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    _nameController.addListener((){
      print(_nameController.text);
    });

    _pwdController.addListener((){
      print(_pwdController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        child: Form(
          key: _globalKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或手机号",
                    icon: Icon(Icons.person_outline)),
                //校验用户名
                validator: (value) {
                  return value.trim().length > 0 ? null : "用户名或手机号不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)),
                obscureText: true,
                //校验密码
                validator: (value) {
                  return value.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text("登录"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            //在这里不能通过此方式获取FormState,context不对
                            //print(Form.of(context));

                            //通过_globalKey.currentState获取FormState后，
                            //调用validate()
                            if((_globalKey.currentState as FormState).validate()){
                              //验证通过，提交数据
                              print("表单数据验证通过！用户名为 ${_nameController.text} 密码为 ${_pwdController.text}");
                            }
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
