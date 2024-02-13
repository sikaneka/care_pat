import 'package:flutter/material.dart';

import 'second_page.dart'; // Import the second page

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the "Let's Go" text
            Text(
              "Let's Go",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            // Add the "Next" button
            ElevatedButton(
              onPressed: () {
                // Navigate to the second page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}