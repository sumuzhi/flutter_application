import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDao {
  static Future<void> login(Map<String, String> body) async {
    // 这里不能写localhost，因为在手机中运行，手机不是localhost
    final uri = Uri.parse('http://192.168.155.118:3000/login');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authorization = prefs.getString('authorization')!;

    final res = await http.post(
      uri,
      headers: <String, String>{
        'a': authorization,
        'Content-Type': 'application/json',
      }, // 必须指定 JSON
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      print(res.headers['authorization']);
      await prefs.setString(
        'authorization',
        res.headers['authorization'] ?? '',
      );
    }
  }
}
