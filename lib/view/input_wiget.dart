import 'package:flutter/material.dart';

class InputWiget extends StatelessWidget {
  // planceHolder
  final String hint;

  // change回调
  final ValueChanged<String>? onChanged;

  // 是否使用password输入框
  final bool obscureText;

  // 控制显示输入面板是数字还是普通
  final TextInputType? keyboardType;

  const InputWiget({
    super.key,
    required this.hint,
    this.onChanged,
    required this.obscureText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      cursorColor: Color.fromRGBO(255, 255, 255, 0.87),
      cursorWidth: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        hint: Text(hint, style: TextStyle(color: Colors.white38)),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 0.369)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 0.57)),
        ),
      ),
    );
  }
}
