import 'package:flutter/material.dart';
import 'package:int_prep/jokes_app/view/screens/homescreen/homescreen.dart';
import 'package:provider/provider.dart';
import 'jokes_app/view/providers/joke_provider/joke_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeProvider>(create: (_) => JokeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

