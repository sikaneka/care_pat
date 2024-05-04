import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "package:project/main.dart";

import '../provider/control.dart';
import 'package:project/auth/login.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    print("codee id her");

    Timer? _timer;


    super.initState();

    Loginprovider provider = Provider.of<Loginprovider>(context, listen: false);



    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginForm()));
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 163, 93, 66),
      body: Center(child: Image.asset("assets/images/logo.png")),

    );
  }
}