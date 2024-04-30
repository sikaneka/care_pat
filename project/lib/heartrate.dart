import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({super.key});

  

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Rate"),
        backgroundColor: const Color.fromARGB(255, 146, 88, 65),
      ),
      backgroundColor: Color.fromARGB(255, 146, 88, 65),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 146, 88, 65)),
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
            Consumer<Loginprovider>(
              builder: (context,value,child) {
                return  Text(
                  "Heart rate is ${value.heart_ratelist.last.toString()} in ideal role, reflecting overall fitness and vitality.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
