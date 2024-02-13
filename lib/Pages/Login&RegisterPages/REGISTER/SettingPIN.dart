import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/Settings/rotasi.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

AssetsColor assetsColor = AssetsColor();
LogicApi logicApi = LogicApi();

class SettingPIN extends StatefulWidget {
  const SettingPIN({super.key});

  @override
  State<SettingPIN> createState() => _SettingPINState();
}

class _SettingPINState extends State<SettingPIN> {
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
          'Atur PIN',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            /// ICON
            Container(
              child: Image.asset(
                assetsIcon.iconNewpin,
                width: 100,
                height: 100,
              ),
            ),

            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'Biar lebih aman buat PIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textSetPINArea),
              ),
            ),

            /// SUB TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Text(
                'PIN akan digunakan untuk hal penting seperti\n'
                'masuk ke akun, bertransaksi, dll',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 15, color: assetsColor.textSetPINArea),
              ),
            ),

            /// OTP FIELD
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
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

            Expanded(
              child: Container(),
            ),

            /// "SIMPAN PIN" BUTTON
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    String textToRotate = "123451:Welhan:6281296023051";
                    String rotatedText = Rotasi.rotateText(textToRotate, 15);
                    print("Rotated Text: $rotatedText");

                    String reversedText =
                        Rotasi.reverseRotateText(rotatedText, 15);
                    print("Reversed Text: $reversedText");

                    /*          String data_nilai = base64Encode(utf8
                        .encode('${"123451"}:${"Welhan"}:${"6281296023051"}'));



                    print(data_nilai);*/

                    logicApi.login();
                    /*      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InputName()),
                    );*/
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: assetsColor.buttonSavePIN,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Simpan PIN'
                        // '& Selesai'
                        ,
                        style: TextStyle(
                            color: assetsColor.textSavePINButton, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
