import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart';

class HeartRate extends StatefulWidget {
  const HeartRate({Key? key});

  @override
  State<HeartRate> createState() => _HeartRateState();
}

class _HeartRateState extends State<HeartRate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Heart Rate"),
        backgroundColor: Color.fromARGB(255, 163, 93, 66),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget with network placeholder
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Color.fromARGB(255, 163, 93, 66), // Border color
            //       width: 2.0, // Border width
            //     ),
            //     // borderRadius: BorderRadius.circular(10.0), // Border radius
            //   ),
               Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7TIaQFsG1LKJ9UTBPB1BtxO7b0B9h_MJgKQ&s",
                width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),
            // ),
            const SizedBox(height: 20),
            // Text widget with description
            Consumer<Loginprovider>(builder: (context, value, child) {
              return value.heart
                  ? Text(
                      "Heart rate is in ideal role ${value.heart_ratelist.last.toString()} bpm, reflecting overall fitness and vitality.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 163, 93, 66),
                          fontFamily: 'serif'),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Heads up: Patient's heart rate is irregular,${value.heart_ratelist.last.toString()} bpm. Monitor closely!.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 163, 93, 66),
                          fontFamily: 'serif'),
                      textAlign: TextAlign.center,
                    );
            }),
          ],
        ),
      ),
    );
  }
}
