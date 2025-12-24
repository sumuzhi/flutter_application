class Person {
  String name;
  int age;

  Person(this.name, this.age);
  void say() {
    print('我是$name, 我今年$age岁');
  }
}

class Student extends Person {
  String? school;
  String? city;
  String? country;
  String? funName;
  Student(this.school, name, age) :  funName = '$school.$name.$age',super(name, age) {
   
    school = school;
  }

  Student.cover(name, age):super(name,age){
    funName = '$name.$age';
  }

  // Student(this._school, String name, int age, {this.city, String? country}){
  //   this.country = country ?? 'China'; // 使用空值判断
  //   this.funName = '$country.$city';
  //   this.super(name, age);
  // }
  // Student(super.name,super.age);
}

void main() {
  var s = Student('清华大学', '张三', 18);
  // s.say();
  // print(s.funName);
  var s2 = Student.cover('张三', 18);
  print(s2.funName);
  print(s2.name);
  print(s2.age);
}
