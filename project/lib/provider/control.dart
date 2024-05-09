import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Loginprovider extends ChangeNotifier {
  final DatabaseReference mRootReference = FirebaseDatabase.instance.ref();
  FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController usernameTextController = TextEditingController();

  void signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('You are Logged in')));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp(),));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password did not match')));
      }
    }
  }

  void signupUser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      saveUser(name, email, userCredential.user!.uid);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void saveUser(String name, email, uid) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set({'email': email, 'name': name, "userid": uid});
  }

  List<String> heart_ratelist = [];
  bool heart = false;
  void getheartrate() {
    heart_ratelist.clear();
    mRootReference.child("heart_rate").onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        map.forEach((key, value) {
          heart_ratelist.add(value.toString());
          print(heart_ratelist.length.toString() + "  length");
          notifyListeners();
        });
        if (int.parse(heart_ratelist.last.toString()) > 60 &&
            int.parse(heart_ratelist.last.toString()) < 100) {
          heart = true;
          notifyListeners();
        } else {
          // Vibrate.vibrate();
          // final player=AudioPlayer();
          // player.play(AssetSource('alarm-beep.mp3'));
          heart = false;
          notifyListeners();
        }
        //print(heart_ratelist[2].toString() + "  length");
        notifyListeners();
      }
    });
  }

  bool falldetection = false;
  void checkfold() {
    mRootReference.child("fall_detection").onValue.listen((event) {
      if (event.snapshot.value != null) {
        mRootReference.child("proximity").onValue.listen((event2) {
          if (event.snapshot.value.toString() == "yes" &&
              event2.snapshot.value == 0) {
            falldetection = true;
            notifyListeners();
          }
        });
      }
    });
  }

  List<String> templist = [];
  bool temp = false;
  void getTemperature() {
    templist.clear();
    mRootReference.child("temperature").onValue.listen((event) {
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> map = event.snapshot.value as Map;
        map.forEach((key, value) {
          templist.add(value.toString());
          print(templist.length.toString() + "  length");
          notifyListeners();
        });
        if (double.parse(templist.last.toString()) > 36.1 &&
            double.parse(templist.last.toString()) < 37.2) {
          temp = true;
          notifyListeners();
        } else {
          temp = false;
          notifyListeners();
        }
        //print(templist[2].toString() + "  length");
        notifyListeners();
      }
    });
  }

  TextEditingController namecontroller = TextEditingController();
  TextEditingController lastcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController medcondcontroller = TextEditingController();
  TextEditingController doctorcontroller = TextEditingController();
  TextEditingController addcontroller = TextEditingController();

  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController relationcontroller = TextEditingController();
  TextEditingController phncontroller = TextEditingController();
  TextEditingController hsptlcontroller=TextEditingController();

  void addregistration(BuildContext context) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> addmap = HashMap();
    addmap["REGISTRATION_ID"] = id;
    addmap["FIRST_NAME"] = namecontroller.text;
    addmap["LAST_NAME"] = lastcontroller.text;
    addmap["PHONE_NUMBER"] = phonenumbercontroller.text;
    addmap["AGE"] = agecontroller.text;
    addmap["GENDER"] = gendercontroller.text;
    addmap["MED_COND"] = medcondcontroller.text;
    addmap["DOCTOR"] = doctorcontroller.text;
    addmap["ADDRESS"] = addcontroller.text;
    addmap["F_NAME"] = fnamecontroller.text;
    addmap["L_NAME"] = lnamecontroller.text;
    addmap["RELATION"] = relationcontroller.text;
    addmap["PHONE"] = phncontroller.text;

    db.collection("PATIENTS").doc(id).set(addmap);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            " Patient registered successfully ",
            style: TextStyle(color: Colors.white, fontSize: 15),
          )),
    );
  }
 /* //  GoogleMapController mapController =GoogleMapController();
  // Add the below method inside the Loginprovider class in the Control page
Future<List<String>> fetchNearbyHospitals(double latitude, double longitude) async {
  // You can implement fetching nearby hospitals using any suitable API or service here
  // For example, you can use Google Places API or any other service
  // This is just a placeholder method
  return ["Hospital A", "Hospital B", "Hospital C"];
}*/

}
