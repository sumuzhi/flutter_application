import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WebViewPage());
  }
}

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // 初始化 WebView 控件
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted); // 启用 JavaScript
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          print("Page started loading: $url");
        },
        onPageFinished: (String url) {
          print("Page finished loading: $url");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('12231'),toolbarTextStyle: TextStyle(color: Colors.white),),
      body: WebViewWidget(
        controller: _controller, // 绑定控制器
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 使用 WebViewController 加载 URL
          _controller.loadRequest(
            Uri.parse(
              'https://appcoreuat.huilianyi.com/h5-core/?loginType=wx&loginName=13517485395&pwd=zhou1234#/',
            ),
          );
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
