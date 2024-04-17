import 'package:flutter/material.dart';

class HeartRate extends StatelessWidget {
  const HeartRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Rate"),
        backgroundColor: Color.fromARGB(255, 146, 88, 65),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 146, 88, 65)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget with network placeholder
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7TIaQFsG1LKJ9UTBPB1BtxO7b0B9h_MJgKQ&s",
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // Text widget with description
            const Text(
              "Heart rate is in ideal role, reflecting overall fitness and vitality.",
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
