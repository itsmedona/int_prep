import 'package:flutter/material.dart';
//import 'package:int_prep/view/screens/image_api_screen/image_api.dart';
import 'package:int_prep/samples/screens/login_screen/login_screen.dart';
//import 'package:int_prep/view/screens/reorder_screen/reorder_list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the required Screen after the seconds
    Future.delayed(Duration(seconds: 5))
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()
                  //ImageList(),
                  //ReorderableListScreen(),
                  ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/123.jpg'),
              Text(
                "Shopsie",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 24),
              Text(
                "The best way to style your life",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
