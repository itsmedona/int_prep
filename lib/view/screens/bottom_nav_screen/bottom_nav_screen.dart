import 'package:flutter/material.dart';
import 'package:int_prep/core/constants/color_constants/color_constant.dart';
import 'package:int_prep/view/screens/image_api_screen/image_api.dart';
import 'package:int_prep/view/screens/login_screen/login_screen.dart';
import 'package:int_prep/view/screens/register_screen/register_screen.dart';
import 'package:int_prep/view/screens/scanner_screen/scanner_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int seletedIndex = 0;
  List<Widget> _screens = [
    ImageList(),
    ScannerScreen(),
    RegistrationScreen(),
    // ShoppingScreen(),
    //ScannerScreen(),
    //ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[seletedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            seletedIndex = value;
            setState(() {});
          },
          currentIndex: seletedIndex,
          selectedItemColor: ColorConstant.primaryGreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: "Shopping"),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner), label: "Scan"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
