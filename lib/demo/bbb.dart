import 'package:flutter/material.dart';

import 'KeepAliveWrapper.dart';

class ShowNumber extends StatelessWidget {
  final int number;

  const ShowNumber({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    print("build $number");
    return Center(
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
          fontFamily: 'huawencaiyun',
        ),
      ),
    );
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({super.key});

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  var children = <Widget>[];

  @override
  void initState() {
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add(KeepAliveWrapper(child: ShowNumber(number: i)));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(allowImplicitScrolling: true, children: children);
  }
}
