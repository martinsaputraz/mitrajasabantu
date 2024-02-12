import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/FORGET_PIN/forgetpin.dart';
import 'package:jasa_bantu/Settings/AssetsColor.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

Constant constants = Constant();
AssetsColor assetsColor = AssetsColor();

class PINLogin extends StatefulWidget {
  const PINLogin({super.key});

  @override
  State<PINLogin> createState() => _PINLoginState();
}

class _PINLoginState extends State<PINLogin> {
  //

  ///FOR 'OTP'
  OtpFieldController setPINController = OtpFieldController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgSettingPINPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgSettingPINPages,
        title: const Text(
          'Masuk',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Text(
                'Masukkan kode PIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textSetPINArea),
              ),
            ),

            /// OTP FIELD
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OTPTextField(
                    controller: setPINController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 5,
                    style: const TextStyle(fontSize: 15),
                    onChanged: (pin) {
                      if (kDebugMode) {
                        print("Changed: $pin");
                      }
                      // if (pin.isEmpty) {
                      //   FocusScope.of(context).previousFocus();
                      // }
                    },
                    onCompleted: (pin) {
                      if (kDebugMode) {
                        print("Completed: $pin");
                      }
                    },
                  ),
                ],
              ),
            ),

            /// "LUPA PIN?" BUTTON
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ForgetPIN()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonForgetPIN,
                side: BorderSide(color: assetsColor.borderForgetPINButton),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              icon: Icon(Icons.live_help_outlined,
                  color: assetsColor.textForgetPINButton),
              label: Text(
                'Lupa PIN?',
                style: TextStyle(color: assetsColor.textForgetPINButton),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
