import 'package:flutter/material.dart';
import 'package:int_prep/view/screens/image_screen/image_screen.dart';
//import 'package:int_prep/view/screens/register_screen/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomableImage(imageUrl: ''),
              //RegistrationScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shopsie",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 24),
                Text(
                  "The best way to style your life",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
