import 'package:flutter/material.dart';
import 'package:flutter_application/dao/login_dao.dart';
import 'package:flutter_application/view/input_wiget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginWiget extends StatefulWidget {
  const LoginWiget({super.key});

  @override
  State<LoginWiget> createState() => _LoginWigetState();
}

class _NoOverScrollBehavior extends ScrollBehavior {
  const _NoOverScrollBehavior();

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // ⭐ 核心：直接返回 child
  }
}

class _LoginWigetState extends State<LoginWiget> {
  String? username;
  String? password;
  bool enableBtn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const _NoOverScrollBehavior(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black26),
              child: SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    SizedBox(height: 40),
                    _setTitle(),
                    SizedBox(height: 40),
                    Image.asset('assets/images/1.jpg'),
                    SizedBox(height: 20),
                    _renderForm(),
                    FilledButton(
                      onPressed: enableBtn ? _login : null,
                      style: FilledButton.styleFrom(
                        disabledBackgroundColor: Colors.black38,
                        backgroundColor: Colors.black45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '登录',
                        style: TextStyle(
                          color: enableBtn ? Colors.white70 : Colors.white38,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: _jump,
                        child: Text(
                          '注册',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _setTitle() {
    return Text('欢迎，登录', style: TextStyle(color: Colors.white, fontSize: 30));
  }

  Widget _renderForm() {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 40),
          _renderFormItem(
            hint: 'usename',
            onChanged: (value) {
              username = value;
              _verifyInput();
            },
          ),
          _renderFormItem(
            hint: 'password',
            obscureText: true,
            onChanged: (value) {
              password = value;
              _verifyInput();
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _renderFormItem({
    String hint = '',
    bool obscureText = false,
    required Null Function(dynamic value) onChanged,
  }) {
    return InputWiget(
      hint: hint,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }

  void _verifyInput() {
    final bool enable;
    if ((username?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      enableBtn = enable;
    });
  }

  void _login() {
    LoginDao.login({'username': username ?? '', 'password': password ?? ''});
  }

  void _jump() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
