// abstract class Study {
//  void learning();
// }

// abstract class Person {
//   String name;
//   int age;
//   Person(this.name, this.age);
//   void say();
// }

// class Student extends Person with Study {
//   Student(super.name, super.age);

//   @override
//   void say() {
//     print('我是$name, 我今年$age岁');
//   }

//   @override
//   void learning() {
//     print('我在学习');
//   }
// }

// void main() {
//   var s = Student('张三', 18);
//   s.say();
//   s.learning();
// }

abstract interface class Tuner {
  void tuneInstrument();
}

mixin Guitarist implements Tuner {
  void playSong() {
    tuneInstrument();

    print('Strums guitar majestically.');
  }
}

class PunkRocker with Guitarist {

  @override
  void tuneInstrument() {
    print("Don't bother, being out of tune is punk rock.");
  }
}
void main() {
  var p = PunkRocker();
  p.playSong();
}