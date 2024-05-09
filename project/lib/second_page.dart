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
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

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
          // Vibrate.vibrate();
          // final player=AudioPlayer();
          // player.play(AssetSource('alarm-beep.mp3'));
          showAlertDialog(
              context, "Warning", "Caution: Temparature is out of range");
        }
      }
    });

    List<String> heart_ratelist = [];
    mRootReference.child("heart_rate").onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        map.forEach((key, value) {
          heart_ratelist.add(value.toString());
          ;
        });
        if (int.parse(heart_ratelist.last.toString()) > 60 &&
            int.parse(heart_ratelist.last.toString()) < 100) {
        } else {
          // Vibrate.vibrate();
          // final player=AudioPlayer();
          // player.play(AssetSource('alarm-beep.mp3'));
          showAlertDialog(
              context, "Warning", "Abnormal heart rate. Please be cautious");
        }

      }
    });

    mRootReference.child("fall_detection").onValue.listen((event) {
      if (event.snapshot.value != null) {
        mRootReference.child("proximity").onValue.listen((event2) {
          if (event.snapshot.value.toString() == "yes" &&
              event2.snapshot.value == 0) {
                // Vibrate.vibrate();
          // final player=AudioPlayer();
          // player.play(AssetSource('alarm-beep.mp3'));
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
              buildCircularContainer('Temperature','https://th.bing.com/th/id/OIP.yEy1SaaSD7zYTKnX4yXvdQHaHa?rs=1&pid=ImgDetMain',
                  () {
                value.getTemperature();

                navigateToNextPage('temperature');
              }),
              buildCircularContainer('Heart Rate','https://th.bing.com/th/id/OIP.sQuwZU74Fm0ymCSv3U0bTwHaHa?pid=ImgDet&w=179&h=179&c=7&dpr=1.3',
                 // 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHUAfQMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABgcBAwUEAv/EADwQAAIBAgMDBgoJBQAAAAAAAAABAgMEBQYREiExBxNBUWGBFBUWIlZxorHB0jJTYoKRkqHC0SQzQlKy/8QAGgEBAAMBAQEAAAAAAAAAAAAAAAIDBAUBBv/EADMRAAIBAgMEBwYHAAAAAAAAAAABAgMRBAUxEiFRsRMUYaHB0fAjQXGBkZIVIiQyNEJi/9oADAMBAAIRAxEAPwC8QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAYlJRi5SaSW9t9BiE41IKdOSlGS1UovVNEd5RrnwXJeJz13zpqmvvSUfiaOS6q6uSMP2nq4OpH25aFe37TY7Lmvqr6p1i/8AbZt8rkrABYZAAAAAAAAAAAAAAAAAACB8slzzOVqVFca91GL9SUn8EbeR+rzmUFD6q5qR9z+J5OUteG5gyxhem1Grc7U12bUV7to+uRxc3g+JW740r6W77sV8DIn+o7j6CUUsmS999rva8CwAAaz58AAAAAAAAA5mX8csswYer3D5SdLacGprSUWuhr8H3nTKyylSqZMzpVy/XqynaX9KM6FSXTNL+dpdyLNK6U3KO/U247DxoVfZu8Grp9j9WAALDEYcoxaTkk3uWr4mSoM9X2JY7mW4eCuTpYBT51zi+E01tNdq4afZZZOV8apY/gltiFLRSnHSrBf4TX0l+P6aFUKqlJxN+Jy+dChCq3e+q4X3q/xRE8V1vuV7C6PGFpaubXU9Jv4xM8l8ubxjNNr9Xe6r8018DGXE73lUx+711jb0VRXY/NX7WZyQuYz/AJqoJabdTnNPvN/uKI/vUu1nTrfx50uFOHO/iWCcjMGY8Oy9G2liVSUFcVNiGzHXTrb7FuOuVNmKzrZ6zhiNpazat8KtpQpyXCVXq75ar1RL6s3Ffl1OZl+Gp16j6V2hFXb5d5bCaaTW9MyRHkzxqWK5chQuG/C7F8xVUuOi+i33bvWmS4nCSlFSRmxFGVCrKlLVAA8WNYjSwnCrq/uP7dCm56f7PoXe9Eet2VyuMXKSjHVnsUottKSbXFJ8DJS+UcVxHA8ctcZxfdY49KaqTfBPa3SfVo3+VsufUrpVVUVzZjsE8JNRvdP3/Dc18mRrOmVfKOnaVLa68EvbSpt0q6jq0urc10pPXsOJ5G5s9Mrj2/mLBAlRjJ3FLMK9KmqcWrLS6T5or7yNzZ6ZXHt/MPI3Nnplce38xYIPOgh2/Vk/xTEf5+2PkRzJmVo5csLilWrq6ubqo51qrjptdS9/4sjy5PsVsbq58Q5iq2NpWqOcaEVJbPZue/Thr2FiA9dGDSXAhHMcRGcp33y1uk19NCLZKypWy7VxC4vL7wy5vZxlOpstcNXv1e9tyZxsFbocr+NU+EatqpevdTf8lhFZ43eRwflOub2W5eK51PW4wen/AAQqRUFG2iZqwdWpiqlZz3ylB91rcjVQeYc25kxrxZjtewtLOsqcFFvZfFbtH9nXvJfkrLCyzYVqU7jwm5uKrqVa2zpr1L3vvZyuSKydDKzu6mrqXledRt8Wl5q9zfeTcUYJpTepHMsTKM5YanZQVluS324vXUgeJZExDx3eYhgOOTw2F21KpThFrzunen16vvNXkbmz0yuPb+YsEEugh6ZSs0xKSTaduMU/Ar7yNzZ6ZXHt/MabvIGYMQpK3xLNVWvbOSc6coyeunY2WOB0EPTZJZriU7q32x8jg5iyvaYzl1YPHShGlGPg81HXmnFaLd6t3eRuGSs1U4RhDONwoxWiXn7l+YsIEpUoydyqjmFelHYi01e+9J80AAWGIAAAAAAFN8ssJ0syWlWm2udslB6dPnS195chDc55Vucex7BbulzXg1tP+pU5aPZ2k93XwaKMRBzhZHUyfEQw+KU5vdZ8iRZesfFuBWFl00aEIy9em/8AXU6ABclZWObObnJyerAAPSIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB//Z',
                  () {
                value.getheartrate();

                navigateToNextPage('heart_rate');
              }),
              buildCircularContainer(
                  'Fall Detection', 'https://th.bing.com/th/id/OIP.W6AyA8AGPqAyEMuhTG9IQQAAAA?w=322&h=322&rs=1&pid=ImgDetMain', () {
                value.checkfold();
                navigateToNextPage('fall_detection');
              }),
              buildCircularContainer(
                  'Assistance','https://th.bing.com/th/id/OIP.Z30M0YFsv4JXQGE9HmNhBwHaHa?pid=ImgDet&w=179&h=179&c=7&dpr=1.3',
                  //'data:image/png;base64,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',
                  () => navigateToNextPage('Assistance')),
              buildCircularContainer(
                  'Emergency Care','https://th.bing.com/th/id/OIP.g3n11ihrIyjtgyVTdifuewAAAA?pid=ImgDet&w=179&h=133&c=7&dpr=1.3',
                 // 'data:image/png;base64,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',
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
