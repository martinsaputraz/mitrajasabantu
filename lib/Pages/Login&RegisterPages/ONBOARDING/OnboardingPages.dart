import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Assets/AssetsIcon.dart';
import 'package:jasa_bantu/Assets/AssetsImage.dart';
import 'package:jasa_bantu/Assets/AssetsLogo.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/LoginPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingContent.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/RegisterPages.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();
AssetsIcon assetsIcon = AssetsIcon();
AssetsImages assetsImages = AssetsImages();

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  //

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgOnboardingPages,
      body: Column(
        children: [
          /// LOGO COMPANY & BUTTON "BAHASA"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// IMAGE LOGO
                Image.asset(
                  assetsLogo.jbLogoCutting,
                  width: 135,
                  height: 25,
                ),

                /// BUTTON "BAHASA"
                ElevatedButton.icon(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  icon: Icon(Icons.translate, color: Colors.white, size: 20),
                  label: Text(
                    'Bahasa',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          /// SLIDE SHOW
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const OnboardingContent(),
          ),

          Expanded(
            child: Container(),
          ),

          /// BUTTON "Masuk dengan Google"
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      // _handleGoogleSignIn();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPages()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: assetsColor.buttonLoginwithGoogle,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                assetsIcon.coloredGoogle,
                                // color: assetsColor.textLoginwithGoogle,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              'Masuk dengan Google',
                              style: TextStyle(
                                  color: assetsColor.textLoginwithGoogle),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: assetsColor.textLoginwithGoogle,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// BUTTON "MASUK & DAFTAR"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// BUTTTON "MASUK DENGAN AKUN JASA BANTU"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPages()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: assetsColor.borderLoginButton),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text(
                      'Masuk dengan akun Jasa Bantu',
                      style: TextStyle(
                          color: assetsColor.textButtonLogin, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPages(message: '')),
                );
              },
              child: Text(
                'Daftar akun Jasa Bantu',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithProvider(googleAuthProvider);
      User? user = userCredential.user;

      if (user != null) {
        setState(() {
          _user = user;
          print("data_user: ${_user}");
        });
      } else {
        print("User is null");
      }
    } catch (error) {
      print(error);
    }
  }
}
