import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Temperature"),
        backgroundColor: Color.fromARGB(255, 163, 93, 66),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: Color.fromARGB(
            //           255, 163, 93, 66), // You can change the color here
            //       width: 2.0, // You can adjust the width here
            //     ),
            //   ),
            // Image widget with network placeholder
            Image.network(
              "data:image/jpeg;base64,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",
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            // ),
            const SizedBox(height: 20),
            // Text widget with description
            Consumer<Loginprovider>(builder: (context, value, child) {
              return value.temp
                  ? Text(
                      "Body Temperature is ${value.templist.last.toString()}°C perfectly balanced, keeping in optimal health.",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 163, 93, 66),
                          fontFamily: 'serif'),
                      // Color.fromARGB(255, 163, 93, 66)
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      "Body temperature's off-key today, ${value.templist.last.toString()}°C. Together, let's work on getting it back on track.",
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
