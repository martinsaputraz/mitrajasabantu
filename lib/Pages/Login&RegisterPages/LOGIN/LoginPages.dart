import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';

AssetsColor assetsColor = AssetsColor();
LogicApi logicApi = LogicApi();

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  //
  /// FOR 'NOMOR HANDPHONE'
/*
  final TextEditingController _phoneNumber = TextEditingController();
*/

  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgLoginPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLoginPages,
        title: Text(
          'Masuk',
          style: TextStyle(fontSize: 20, color: assetsColor.textLoginArea),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO JASA BANTU BG WHITE
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Image.asset(
              assetsLogo.jbLogoBGWhite,
              width: 115,
              height: 25,
            ),
          ),

          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Masuk dengan nomor HP Kamu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textLoginArea),
            ),
          ),

          /// SUB TITLE TEXT
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Text(
              'Selamat datang kembali!',
              style: TextStyle(
                fontSize: 15,
                color: assetsColor.textLoginArea,
              ),
            ),
          ),

          /// "PHONE" TEXT FIELDS
          /*       Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Center(
              child: TextField(
                controller: _phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: 'Nomor Handphone',
                    prefixIcon:
                        Icon(Icons.phone, color: assetsColor.textLoginArea),
                    prefixText: '+62'),
              ),
            ),
          ),*/

          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Center(
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  prefixIcon:
                      Icon(Icons.phone, color: assetsColor.textLoginArea),
                ),
                initialCountryCode: 'ID',
                // Set the initial country code to Indonesia
                // Limit selection to Indonesia
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                  print(phoneNumber);
                },
                inputFormatters: [],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                const Icon(Icons.info_outline),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' Nomor sudah tidak aktif atau hilang? ',
                        style: TextStyle(
                          color: assetsColor.textLoginArea,
                        ),
                      ),
                      TextSpan(
                        text: 'Atur ulang',
                        style: TextStyle(
                          color: assetsColor.textLoginArea,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const RegisterApps()),
                            // );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// TEXT SPAN "KETENTUAN LAYANAN" & "KEBIJAKAN PRIVASI"
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Dengan melanjutkan, kamu setuju sama\n',
                          style: TextStyle(
                            color: assetsColor.textLoginArea,
                          ),
                        ),
                        TextSpan(
                          text: 'Ketentuan Layanan',
                          style: TextStyle(
                            color: assetsColor.textLoginArea,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const RegisterApps()),
                              // );
                            },
                        ),
                        TextSpan(
                          text: ' dan ',
                          style: TextStyle(
                            color: assetsColor.textLoginArea,
                          ),
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi',
                          style: TextStyle(
                            color: assetsColor.textLoginArea,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const RegisterApps()),
                              // );
                            },
                        ),
                        TextSpan(
                          text: ' Jasa Bantu',
                          style: TextStyle(
                            color: assetsColor.textLoginArea,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// BUTTON "LANJUTKAN"
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
/*

                      String phoneNumber = _phoneNumber.text;
*/
                      if (phoneNumber.startsWith('+')) {
                        phoneNumber =
                            phoneNumber.substring(1); // Remove the leading '+'
                      }
                      print(phoneNumber);
/*
                      logicApi.checkPhone(context, phone);
*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPages()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: assetsColor.buttonNextRegister,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lanjutkan',
                          style: TextStyle(
                              color: assetsColor.textNextButton, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // ),
    );
  }
}
