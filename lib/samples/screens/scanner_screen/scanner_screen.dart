import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:int_prep/samples/screens/splash_screen/splash_screen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../../core/constants/color_constants/color_constant.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
          result = scanData;
        });
        _navigateToDetailsScreen();
      }
    });
  }

  void _navigateToDetailsScreen() {
    Timer(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ),
        );
        isLoading = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/736x/8c/98/99/8c98994518b575bfd8c949e91d20548b.jpg"),
                fit: BoxFit.cover)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
          child: Container(
            // color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Scan your Code",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: ColorConstant.mainBlack),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 300,
                          width: MediaQuery.sizeOf(context).width * .90,
                          child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}
