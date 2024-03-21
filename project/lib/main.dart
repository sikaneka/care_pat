// import 'package:flutter/material.dart';
// import 'first_page.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: FirstPage(), // Set FirstPage as the initial route
//   ));
// }


import 'package:flutter/material.dart';
import 'first_page.dart';

void main() {
  runApp(const CarePat());
}

class CarePat extends StatelessWidget {
  const CarePat({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'care_pat',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: FirstPage(),
    );
  }
}

