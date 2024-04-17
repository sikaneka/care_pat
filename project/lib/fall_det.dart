import 'package:flutter/material.dart';

class FallDetection extends StatelessWidget {
  const FallDetection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fall Detection"),
        backgroundColor:
            Color.fromARGB(255, 146, 88, 65), // Change the color as desired
      ),
      backgroundColor:
          Color.fromARGB(255, 146, 88, 65), // Change the color as desired
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/fall.png",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Text widget with description
            const Text(
              "There is a high likelihood of falling.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
