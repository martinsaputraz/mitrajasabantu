import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:package_info_plus/package_info_plus.dart';

AssetsColor assetsColor = AssetsColor();
Constant constant = Constant();

class SplashScreen extends StatefulWidget {
  final PackageInfo packageInfo;

  const SplashScreen({Key? key, required this.packageInfo}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const OnboardingPages(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeIn;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgSplashScreen,
      body: Center(
        child: Column(
          children: [
            /// IMAGE LOGO
            Container(
              margin: const EdgeInsets.only(top: 150, bottom: 10),
              child: Image.asset(
                assetsLogo.assetsLogo,
                width: 250,
                height: 100,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// BOTTOM TEXT
            /// VERSION & COMPANY
            Container(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  Text(
                    'Versi ${widget.packageInfo.version} (Alpha)',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: assetsColor.textSplashScreen),
                  ),
                  Text(
                    constant.namaPT,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: assetsColor.textSplashScreen),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
