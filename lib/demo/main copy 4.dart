import 'package:flutter/material.dart';

void main() =>
    runApp(const MyStatefulWidget(title: "StatelessWidget与StatefulWidget开发指南"));

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required this.title});
  final String title;
  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          children: [
            Text("开关状态：${isOpen ? '开启' : '关闭'}"),
            Switch(
              value: isOpen,
              onChanged: (change) {
                setState(() {
                  isOpen = change;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
