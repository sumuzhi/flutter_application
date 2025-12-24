class Person {
  String name;
  int age;
  String gender;

  Person(this.name, {this.age = 0, this.gender = '男'});
  void say() {
    print('我是$name, 我今年$age岁');
  }
}

void main() {
  Person('张三', gender: '男', age: 18);
}
