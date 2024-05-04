import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/provider/control.dart';
import 'package:project/splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
    runApp(CarePat());
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCIghJx7VkeANVc4MkOp5R9LIdr52Ryq5o",
            authDomain: "care-pat.firebaseapp.com",
            databaseURL: "https://care-pat-default-rtdb.firebaseio.com",
            projectId: "care-pat",
            storageBucket: "care-pat.appspot.com",
            messagingSenderId: "1008121233833",
            appId: "1:1008121233833:web:3226f85b40975bcfd284b8",
            measurementId: "G-XWGCLLX8NZ"));
  }
  runApp(const CarePat());
}

class CarePat extends StatelessWidget {
  const CarePat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Loginprovider(),
        ),
      ],
      child: const MaterialApp(
        title: 'care_pat',
        home: SplashScreen(),
      ),
    );
  }
}
