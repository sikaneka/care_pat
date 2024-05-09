// container adding
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project/assistance.dart';
import 'package:project/emergency.dart';
import 'package:project/fall_det.dart';
import 'package:project/heartrate.dart';
import 'package:project/pat_reg.dart';
import 'package:project/provider/control.dart';
import 'package:provider/provider.dart';

import 'third_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

final DatabaseReference mRootReference = FirebaseDatabase.instance.ref();

class _SecondPageState extends State<SecondPage> {
  void navigateToNextPage(String image) {
    switch (image) {
      case 'Register your patient':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegistrationForm()));
        break;

      case 'temperature':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ThirdPage()));
        break;
      case 'heart_rate':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HeartRate()));
        break;
      case 'fall_detection':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FallDetection()));
        break;
      case 'Assistance':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Assistance()));
        break;
      case 'Emergency Care':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Emergency()));
        break;
      default:
        break;
    }
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    mRootReference.child("temperature").onValue.listen((event) {
      if (event.snapshot.value != null) {
        List<String> templist = [];
        bool temp = false;
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        map.forEach((key, value) {
          templist.add(value.toString());
        });

        print(templist.last.toString() + "hjgjh");
        if (double.parse(templist.last.toString()) > 36.1 &&
            double.parse(templist.last.toString()) < 37.2) {
          print(".");
        } else {
          showAlertDialog(
              context, "Warning", "Caution: Temparature is out of range");
        }
        print(templist[2].toString() + "  length");
      }
    });

    List<String> heart_ratelist = [];
    mRootReference.child("heart_rate").onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        map.forEach((key, value) {
          heart_ratelist.add(value.toString());
          print(heart_ratelist.length.toString() + "  length");
          ;
        });
        if (int.parse(heart_ratelist.last.toString()) > 60 &&
            int.parse(heart_ratelist.last.toString()) < 100) {
        } else {
          showAlertDialog(
              context, "Warning", "Abnormal heart rate. Please be cautious");
        }
        print(heart_ratelist[2].toString() + "  length");
      }
    });

    mRootReference.child("fall_detection").onValue.listen((event) {
      if (event.snapshot.value != null) {
        mRootReference.child("proximity").onValue.listen((event2) {
          if (event.snapshot.value.toString() == "yes" &&
              event2.snapshot.value == 0) {
            showAlertDialog(context, "Warning",
                "Fall is detected. Please be on you guard.");
          }
        });
      }
    });

    return Scaffold(
      body: Consumer<Loginprovider>(builder: (context, value, child) {
        return Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              buildCircularContainer(
                  'Register your patient',
                  'https://cdn4.iconfinder.com/data/icons/head-hunting-and-human-resources-v-1/100/job-03-512.png',
                  () => navigateToNextPage('Register your patient')),
              buildCircularContainer('Temperature', 'assets/images/temp.png',
                  () {
                value.getTemperature();

                navigateToNextPage('temperature');
              }),
              buildCircularContainer(
                  'Heart Rate', 'assets/images/hear-rate-dp.jpeg', () {
                value.getheartrate();

                navigateToNextPage('heart_rate');
              }),
              buildCircularContainer(
                  'Fall Detection', 'assets/images/fall-dp.jpeg', () {
                value.checkfold();
                navigateToNextPage('fall_detection');
              }),
              buildCircularContainer(
                  'Assistance',
                  'assets/images/assist-dp.png',
                  () => navigateToNextPage('Assistance')),
              buildCircularContainer(
                  'Emergency Care',
                  'assets/images/emerg-dp.png',
                  () => navigateToNextPage('Emergency Care')),
            ],
          ),
        );
      }),
    );
  }

  Widget buildCircularContainer(
      String text, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: AspectRatio(
          aspectRatio: 3,
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
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 163, 93, 66)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String title, String text) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(text),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
