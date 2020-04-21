import 'package:flutter/material.dart';

class ImageDemo extends StatefulWidget {

  ImageDemo({Key key}) : super(key: key);

  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {

  bool hadLoadPic = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ImageDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "从asset中加载图片",
                style: TextStyle(
                  fontSize: 20.0
                ),
              ),
              Image(
                image: AssetImage(
                    hadLoadPic ? "images/xuexiao.png" : ""),
                width: 100.0,
              ),
              Image.asset(
                "images/yuangui.png",
                width: 100.0),
              Text(
                "从网络加载图片",
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
              Image(
                image: NetworkImage("http://longsh1z.top/resources/avatar.jpg"),
                width: 100.0,
              ),
              Image.network(
                "http://longsh1z.top/resources/avatar_male.png",
                width: 100.0,
              ),
              Text(
                "IconFont",
                style: TextStyle(
                    fontSize: 20.0
                ),
              ),
              Text(
                "\uE914 \uE000 \uE90D",
                style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.access_alarm,color: Colors.green,),
                  Icon(Icons.work,color: Colors.green,),
                  Icon(Icons.accessibility_new,color: Colors.green,),
                ],
              )
            ],
          ),
        )
    );
  }
}
