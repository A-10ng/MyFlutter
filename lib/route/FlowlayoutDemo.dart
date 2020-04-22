import 'package:flutter/material.dart';

class FlowlayoutDemo extends StatefulWidget {
  FlowlayoutDemo({Key key}) : super(key: key);

  @override
  _FlowlayoutDemoState createState() => _FlowlayoutDemoState();
}

class _FlowlayoutDemoState extends State<FlowlayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FlowlayoutDemo"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Wrap(
                spacing: 8.0, //主轴（水平）方向间距
                runSpacing: 4.0, //纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: <Widget>[
                  new Chip(
                    label: Text("Hamilton"),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('A'),
                    ),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('M'),
                    ),
                    label: Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('H'),
                    ),
                    label: Text('Mulligan'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text('L'),
                    ),
                    label: Text('Laurens'),
                  ),
                ],
              ),
              Flow(
                  delegate: TestFlowDelegate(margin : EdgeInsets.all(10.0)),
                  children: <Widget>[
                    Container(width: 80.0,height: 80.0,color: Colors.red,),
                    Container(width: 80.0,height: 80.0,color: Colors.green,),
                    Container(width: 80.0,height: 80.0,color: Colors.blue,),
                    Container(width: 80.0,height: 80.0,color: Colors.brown,),
                    Container(width: 80.0,height: 80.0,color: Colors.yellowAccent,),
                    Container(width: 80.0,height: 80.0,color: Colors.purple,),
                  ],
              ),
            ],
          ),
        ));
  }
}

class TestFlowDelegate extends FlowDelegate{
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for(int i = 0;i < context.childCount;i++){
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width){
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }else{
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget（有优化）
        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    return Size(double.infinity,200.0);
  }
}