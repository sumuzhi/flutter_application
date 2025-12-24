// // import 'package:english_words/english_words.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => MyAppState(),
// //       child: MaterialApp(
// //         title: 'Namer App',
// //         theme: ThemeData(
// //           useMaterial3: true,
// //           colorScheme: ColorScheme.fromSeed(
// //             seedColor: const Color.fromARGB(255, 0, 221, 51),
// //           ),
// //         ),
// //         home: MyHomePage(),
// //       ),
// //     );
// //   }
// // }

// // class MyAppState extends ChangeNotifier {
// //   var current = WordPair.random();
// //   // ↓ Add this.
// //   void getNext() {
// //     current = WordPair.random();
// //     notifyListeners();
// //   }

// //   // ↓ Add the code below.
// //   var favorites = <WordPair>[];

// //   void toggleFavorite() {
// //     if (favorites.contains(current)) {
// //       favorites.remove(current);
// //     } else {
// //       favorites.add(current);
// //     }
// //     notifyListeners();
// //   }
// // }

// // // ...

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   var selectedIndex = 0;
// //   @override
// //   Widget build(BuildContext context) {
// //     Widget page;
// //     switch (selectedIndex) {
// //       case 0:
// //         page = GeneratorPage();
// //         break;
// //       case 1:
// //         page = FavoritesPage();
// //         break;
// //       default:
// //         throw UnimplementedError('no widget for $selectedIndex');
// //     }
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         return Scaffold(
// //           body: Row(
// //             children: [
// //               SafeArea(
// //                 child: NavigationRail(
// //                   extended: constraints.maxWidth >= 600, // ← Here.
// //                   destinations: [
// //                     NavigationRailDestination(
// //                       icon: Icon(Icons.home),
// //                       label: Text('Home'),
// //                     ),
// //                     NavigationRailDestination(
// //                       icon: Icon(Icons.favorite),
// //                       label: Text('Favorites'),
// //                     ),
// //                   ],
// //                   selectedIndex: selectedIndex,
// //                   onDestinationSelected: (value) {
// //                     print('selected: $value');
// //                     // ↓ Replace print with this.
// //                     setState(() {
// //                       selectedIndex = value;
// //                     });
// //                   },
// //                 ),
// //               ),
// //               Expanded(
// //                 child: Container(
// //                   color: Theme.of(context).colorScheme.primaryContainer,
// //                   child: page, // ← Here.
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class GeneratorPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     var appState = context.watch<MyAppState>();
// //     var pair = appState.current;

// //     IconData icon;
// //     if (appState.favorites.contains(pair)) {
// //       icon = Icons.favorite;
// //     } else {
// //       icon = Icons.favorite_border;
// //     }

// //     return Center(
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           BigCard(pair: pair),
// //           SizedBox(height: 10),
// //           Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               ElevatedButton.icon(
// //                 onPressed: () {
// //                   appState.toggleFavorite();
// //                 },
// //                 icon: Icon(icon),
// //                 label: Text('Like'),
// //               ),
// //               SizedBox(width: 10),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   appState.getNext();
// //                 },
// //                 child: Text('Next'),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ...
// // class BigCard extends StatelessWidget {
// //   const BigCard({super.key, required this.pair});

// //   final WordPair pair;

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     // ↓ Add this.
// //     final style = theme.textTheme.displayMedium!.copyWith(
// //       color: theme.colorScheme.onPrimary,
// //     );
// //     return Card(
// //       color: theme.colorScheme.primary,
// //       child: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Text(pair.asLowerCase, style: style),
// //       ),
// //     );
// //   }
// // }
// // // ...

// // class FavoritesPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     var appState = context.watch<MyAppState>();

// //     if (appState.favorites.isEmpty) {
// //       return Center(
// //         child: Text('No favorites yet.'),
// //       );
// //     }

// //     return ListView(
// //       children: [
// //         Padding(
// //           padding: const EdgeInsets.all(20),
// //           child: Text('You have '
// //               '${appState.favorites.length} favorites:'),
// //         ),
// //         for (var pair in appState.favorites)
// //           ListTile(
// //             leading: Icon(Icons.favorite),
// //             title: Text(pair.asLowerCase),
// //           ),
// //       ],
// //     );
// //   }
// // }

// typedef GetName = String? Function();
// typedef Sum = int Function(int, int);
// main() {
//   /*  getName() {
//     if (1 == 1) {
//       return null;
//     }
//     return 'asdsd';
//   }

//   var a = getName();
//   print(a);

//   dynamic list = [];
//   list.add('123');
//   list.add(123);
//   print(list);

//   List<dynamic> list2 = [321];
//   list2.add(123);
//   list2.add('123');
//   print(list2);

//   // print(getName());

//   // print('hello world');

//   */
//   var list3 = [1, 2, 3, 4];

//   getName1() => '213';

//   var a = getName1();
//   print(a);
//   var list4 = list3.map((e) {
//     print(e);
//     return e + 1;
//   });
//   print(list4);
//   print("-----------------");
//   dynamic sum(a, b) {
//     return a + b;
//   }

//   // var c = sum(1, 2);
//   Sum d = sum;
//   var dd = d(1, 2);
//   print(dd);
//   // var ddd = d('asd', 'vvv');
//   // print(ddd);
//   // print(c);
// }
// d

// void main(List<String> args) {
// print('hello world');
// print(args);
// return 1;

// List<String> list = ['123', '456'];
// for(var (item,i) in list.asMap().entries){
//   print('----$item===${list.indexOf(item)}===${i}');
//   print(item);
// }
// print(list);

// var obj = {"name": "tom", "age": 18, "sex": "男"};
// var a = m1.map((key, value) {
//   print(key);
//   return value;
// }).toList();
// print(a);
// var valuesList = obj.map((key, value) => value).values.toList();
// print(valuesList);  // [1, 2, 3]
// m1["name"] = "jerry";
// m1['add'] = '阿迪力江离开健康';
// var m2 =m1.entries.map((e) {
//   print("${e.key} === ${e.value}");
//   return e;
// }).toList();
// print(m2);
// var a = MapEntry('phone', 123123).toString();
// print(a);
// m1.addEntries([a]);
// print(m1);

//   var i = 0;
//   if(i == 0){
//     print('111');
//   }

// }

// void main(List<String> args) {
//   // int score = int.parse(args[0]);
//   // if (score <= 100 && score >= 90) {
//   //   print('excellent');
//   // } else if (score < 90 && score >= 80) {
//   //   print('good');
//   // } else if (score < 80 && score >= 70) {
//   //   print('fair');
//   // } else if (score < 70 && score >= 60) {
//   //   print('poor');
//   // } else {
//   //   print('error');
//   // }

//   // var list = [1, 2, 3, 4, 5];
//   // var list1 = list.where((e) {
//   //   return e > 3;
//   // }).toList();
//   // print(list1);
//   List.generate(10, (e) => e * 2).where((i) {
//     print('111==$i');
//     return i < 5;
//   });
//   // print(list2);

//   // fn1(null);
//   // fn1(100);

//   fn4(int a, {required int b, dynamic c}) {
//     print(a);
//     print(b);
//     print(c);
//   }

//   fn4(1, b: 2);
// }

// fn1(int? a) {
//   try {
//     if (a! > 60) {
//       print('111');
//     } else {
//       print('222');
//     }
//   } catch (e) {
//     print(e);
//   }
// }

// class User {
//   final String name;
//   final String email;

//   User(this.name, this.email);

//   User.fromJson(Map<String, dynamic> json)
//     : name = json['name'],
//       email = json['email'];

//   toJson() => {'name': name, 'email': email};
// }

// class User {
//   String name;
//   String email;

//   User(this.name, this.email);

//   set userInfo(Map<String, String> userData) {
//     name = userData['name'] ?? name; // 如果没有提供 name，则保持原有值
//     email = userData['email'] ?? '123@m.com'; // 如果没有提供 email，则设为默认值
//   }

//   get userInfo112 {
//     return {'name': name, 'email': email};
//   }
// }

// void main() {
//   var u1 = User('tom', '11@qq.com');
//   u1.userInfo = {'name': '123', 'email': '456@m.com'};
//   print(u1.userInfo112); // {'name': '123', 'email': '456@m.com'}
// }

class User2 {
  String name;
  String email;
  String _a;

  User2(this.name, this.email, this._a);

  set userInfo(Map<String, String> userData) {
    print('111==$name');
    name = userData['name'] ?? name;
    email = userData['email'] ?? email;
    // email = '123@m.com';
  }

  get userInfo112 {
    return {'name': name, 'email': email,'_a':_a};
  }
}

void main() {
  var u1 = User2('tom', '11@qq.com','sss');
  // u1.userInfo = {'name': '123', 'email': '456@m.com'};

  u1.name = '123';
  u1._a ='12313';
  print(u1.userInfo112);
}

// print(u1.userInfo);
