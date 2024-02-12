import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Assets/AssetsIcon.dart';
import 'package:jasa_bantu/Assets/AssetsImage.dart';
import 'package:jasa_bantu/Assets/AssetsLogo.dart';
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
                Container(
                  child: Image.asset(
                    assetsLogo.jbLogoCutting,
                    width: 135,
                    height: 25,
                  ),
                ),

                /// BUTTON "BAHASA"
                ElevatedButton.icon(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: assetsColor.buttonSwitchLanguage,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  icon: Icon(Icons.translate,
                      color: assetsColor.textSwitchLanguage, size: 20),
                  label: Text(
                    'Bahasa',
                    style: TextStyle(color: assetsColor.textSwitchLanguage),
                  ),
                ),
              ],
            ),
          ),

          /// SLIDE SHOW
          Container(
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
                    onPressed: () {},
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

          const Divider(
            height: 30,
            thickness: 1,
            color: Colors.white12,
          ),

          /// KOMPONEN BUTTON "MASUK & DAFTAR"
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              'Atau gunakan nomor handphone kamu',
              textAlign: TextAlign.center,
              style: TextStyle(color: assetsColor.textOnboardingArea),
            ),
          ),

          /// BUTTON "MASUK & DAFTAR"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// BUTTTON "MASUK"
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPages()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: assetsColor.buttonLogin,
                        side: BorderSide(color: assetsColor.borderLoginButton),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                            color: assetsColor.textButtonLogin, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                /// BUTTON DAFTAR
                Expanded(
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPages()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: assetsColor.buttonRegister,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                            color: assetsColor.textButtonRegister,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
