// ignore: file_names

// import 'second_page.dart'; // Import the second page

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Display the "Let's Go" text
//             // Text(
//             //   "Let's Go",
//             //   style: TextStyle(fontSize: 30),
//             // ),
//             // SizedBox(height: 20),z
//             // Add the "Next" button
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the second page when the button is pressed
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SecondPage()),
//                 );
//               },
//               child: Text("Lets go"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:project/second_page.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset('assets/care_pat.jpeg'), // your image path
                const SizedBox(height: 20.0),
                const Text(
                  'welcome to care_pat',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()), 
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}