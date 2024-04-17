
// container adding
import 'package:flutter/material.dart';
import 'package:project/bp.dart';
import 'package:project/fall_det.dart';
import 'package:project/heartrate.dart';

import 'third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  void navigateToNextPage(String image) {
    switch (image) {
      case 'temperature':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ThirdPage()));
        break;
      case 'blood_pressure':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BloodPressure()));
        break;
      case 'heart_rate':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HeartRate()));
        break;
      case 'fall_detection':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FallDetection()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 104, 67, 52)),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            buildCircularContainer(
                'Temperature',
                'data:image/png;base64,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',
                () => navigateToNextPage('temperature')),
            buildCircularContainer(
                'Blood Pressure',
                'https://static.vecteezy.com/system/resources/previews/025/782/718/original/blood-pressure-icon-free-vector.jpg',
                () => navigateToNextPage('blood_pressure')),
            buildCircularContainer(
                'Heart Rate',
                'data:image/jpeg;base64,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',
                () => navigateToNextPage('heart_rate')),
            buildCircularContainer(
                'Fall Detection',
                'data:image/jpeg;base64,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',
                () => navigateToNextPage('fall_detection')),
            buildCircularContainer(
                'Assistance',
                'data:image/png;base64,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',
                () => navigateToNextPage('assistance')),
            buildCircularContainer(
                'Emergency Care',
                'data:image/png;base64,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',
                () => navigateToNextPage('emergency_care')),
          ],
        ),
      ),
    );
  }

  Widget buildCircularContainer(
      String text, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
