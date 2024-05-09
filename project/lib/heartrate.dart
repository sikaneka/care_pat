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

      
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://th.bing.com/th/id/OIP.444Sj897O3eL-Qe-wpGQYAHaE8?w=273&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7',
            width: 250,
                height: 200,
                fit: BoxFit.cover,
              ),              const SizedBox(height: 20),
              Consumer<Loginprovider>(builder: (context, value, child) {
                return value.heart
                    ? Text(
                        "Current heart rate : ${value.heart_ratelist.last.toString()} bpm.\n"
                        "Heart rate is in ideal role, reflecting overall fitness and vitality.",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 163, 93, 66),
                            fontFamily: 'serif'),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        "Current heart rate : ${value.heart_ratelist.last.toString()} bpm. \n"
                        "Patient's heart rate is irregular, Monitor closely!.",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 163, 93, 66),
                            fontFamily: 'serif'),
                        textAlign: TextAlign.center,
                      );
              }),
            ],
          ),

        ),
      ),
    );
  }
}
