import 'package:aes256gcm/aes256gcm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Settings/AssetsColor.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/local_database/secure_storage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

Constant constants = Constant();
AssetsColor assetsColor = AssetsColor();

class SettingPIN extends StatefulWidget {
  const SettingPIN({super.key});

  @override
  State<SettingPIN> createState() => _SettingPINState();
}

class _SettingPINState extends State<SettingPIN> {
  //

  ///FOR 'OTP'
  OtpFieldController setPINController = OtpFieldController();
  String setPIN = "";
  String screatelkey = "";
  late String hashed = "";
  String skripshett = "";

  @override
  void initState() {
    secureCode();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void secureCode() async {
    // Create an instance of Securestorage
    Securestorage secureStorage = Securestorage();

    // Call the secureToken method to retrieve values
    Map<String, String> secureValues = await secureStorage.secureToken('');

    // Retrieve the screatelkey value from the map
    setState(() {
      screatelkey = secureValues['screatelkey'] ?? '';
    });
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
            Image.asset(
              constants.imagePin,
              width: 100,
              height: 100,
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
                      setState(() {
                        setPIN = pin;
                      });
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
                  onPressed: () async {
                    var text =
                        'gAAAAABlw1C15JeuV5dHI52liC8F3Bs1ytNb2siKLXUZ6bo9t-Z6DlDLi6DmmMqpYESUs5VLhrMC0aOfWHR10sA9EzFgXhb2aw==';
                    var password =
                        'MDEwMjAzMDQwNTA2MDcwODA5MTAxMTEyMTMxNDE1MTY=';

                    var encrypted = await Aes256Gcm.encrypt(text, password);
                    var decrypted = await Aes256Gcm.decrypt(text, password);

                    setState(() {
                      skripshett =
                          encrypted; // Assign the encrypted value directly, assuming encrypted is a string
                    });

                    print('Encrypted text: $decrypted');
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
                        'Simpan PIN & Selesai',
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
