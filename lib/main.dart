import 'package:flutter/material.dart';
import 'package:flutter_application/view/login_wiget.dart';
import 'demo/aaa.dart';
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, required this.title});
  final String title;
  @override
  MyStatefulWidgetState createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isOpen = false;
  //定义一个controller
  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
    _unameController.text = "hello world!";
    _unameController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _unameController.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Column(
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
              ElevatedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送"),
                onPressed: () {
                  print('发送');
                },
              ),
              TextButton(child: Text("normal"), onPressed: () {}),
              OutlinedButton(child: Text("normal"), onPressed: () {}),
              IconButton(icon: Icon(Icons.thumb_up), onPressed: () {}),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300.0),
                child: Image.network(
                  "https://sns-webpic-qc.xhscdn.com/202510091154/420c26b40a09c524423f8c5c088efa85/1040g00831mu49or3li1048bdku9i4viie3oe8r0!nc_n_webp_mw_1",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              TextField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        hintColor: Colors.grey[200], //定义下划线颜色
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0), //定义提示文本样式
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Focus测试")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode1, //关联focusNode1
                decoration: InputDecoration(
                  labelText: "用户名",
                  // border: InputBorder.none, //隐藏下划线
                  // hintText: "用户名或邮箱",
                  // prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                focusNode: focusNode2, //关联focusNode2
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 255, 0, 0),
                    ),
                  ),
                  // 设置获得焦点时的下划线颜色
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 22.0,
                    ), // 点击后变成蓝色
                  ),
                ),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      ElevatedButton(
                        child: Text("移动焦点"),
                        onPressed: () {
                          //将焦点从第一个TextField移到第二个TextField
                          // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                          // 这是第二种写法
                          focusScopeNode ??= FocusScope.of(context);
                          focusScopeNode?.requestFocus(focusNode2);
                        },
                      ),
                      ElevatedButton(
                        child: Text("隐藏键盘"),
                        onPressed: () {
                          // 隐藏键盘
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: Text("Form测试")),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey, //设置globalKey，用于后面获取FormState
                autovalidateMode: AutovalidateMode.onUserInteraction, //开启自动校验
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v!.trim().isNotEmpty ? null : "用户名不能为空";
                      },
                    ),
                    TextFormField(
                      controller: _pwdController,
                      decoration: InputDecoration(
                        labelText: "密码",
                        hintText: "您的登录密码",
                        prefixIcon: Icon(Icons.lock),
                      ),
                      //校验密码
                      obscureText: true,
                      validator: (v) {
                        print(v);
                        return v!.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (ctx) {
                  return Column(
                    children: <Widget>[
                      ElevatedButton(
                        child: Text("登录"),
                        onPressed: () {
                          // 校验通过后，提交数据
                          if ((_formKey.currentState as FormState).validate()) {
                            // 验证通过,提交数据
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.maxWidth);
        print(11111111111111);
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          // 大于200，显示双列
          var children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              children.add(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [children[i], children[i + 1]],
                ),
              );
            } else {
              children.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        }
      },
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = List.generate(6, (index) => Text("Item $index"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("LayoutBuilder"),
          animateColor: true,
          surfaceTintColor: const Color.fromARGB(0, 255, 255, 255),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          shadowColor: Colors.transparent,
        ),
        body: InfiniteListView(),
      ),
    );
  }
}


class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "1ABCDEFGHIJKLMNJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return ListView.builder(
      itemCount: 200,
      // prototypeItem: ListTile(title: Text("1")),
      itemExtent: 10.0, //强制高度为50.0
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("q-1q3-$index"));
      },
    );
  }
}

void main() => runApp(LoginWiget());
