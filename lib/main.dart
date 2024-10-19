import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_buddy/screens/splash_screen.dart';

const FirebaseOptions firebaseOptions =FirebaseOptions(
    apiKey: 'AIzaSyBra5l0dZX4vSUuSvS9xdbN9CCbEFodDYs',
    appId: "1:567472026305:android:d5eeb82cc4e1097301da40",
    messagingSenderId: '567472026305',
    projectId: 'food-buddy-1bfc4',
);



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Buddy',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen() ,
    );
  }
}


