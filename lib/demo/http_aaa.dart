import 'dart:convert' show jsonDecode;
class SubData {
  int? code;
  String? method;
  String? requestPrams;

  SubData({this.code, this.method, this.requestPrams});

  SubData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    method = json['method'];
    requestPrams = json['requestPrams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['method'] = method;
    data['requestPrams'] = requestPrams;
    return data;
  }
}
class Data {
  int? code;
  SubData? data;
  String? msg;
  Data({this.code, this.data, this.msg});
  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = (json['data'] != null ? SubData.fromJson(json['data']) : null);
    msg = json['msg'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['data'] = data;
    data['msg'] = msg;
    return data;
  }
}

//json转Model
void _json2Model() {
  var jsonString =
      '{"code":0,"data":{"code":0,"method":"GET","requestPrams":"11"},"msg":"SUCCESS."}';
  Map<String, dynamic> map = jsonDecode(jsonString); //将json转成Map；
  Data model = Data.fromJson(map); //将Map转成Dart Model
  print('code: ${model.code};requestPrams:${model.data?.requestPrams};msg:${model.msg}');
  // setState(() {
  //   resultShow =
  //       'code: ${model.code};requestPrams:${model.data?.requestPrams}'; //使用Map中的数据
  // });
}

void main(){
  _json2Model();
}