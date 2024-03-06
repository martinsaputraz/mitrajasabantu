import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/PINLogin.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/ModalBottomOTPContent.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ResendOTPButtonFunction.dart';
import 'package:jasa_bantu/Settings/rotasi.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

AssetsColor assetsColor = AssetsColor();

class OTPVerifyNewPhone extends StatefulWidget {
  const OTPVerifyNewPhone({super.key});

  @override
  State<OTPVerifyNewPhone> createState() => _OTPVerifyNewPhoneState();
}

class _OTPVerifyNewPhoneState extends State<OTPVerifyNewPhone> {
  //

  ///FOR 'OTP'
  OtpFieldController otpRegisterController = OtpFieldController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  String? storedNoHp;
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";

  /// FOR BUTTON "RESEND OTP"
  bool isResendOTPPressed = false;

  /// TIMER "RESEND OTP"
  late DateTime endTime;
  late Timer timer;

  /// FOR SELECTED METHOD "RESEND OTP SMS / WA"
  String selectedMethod = '';
  bool selectedRadioMethod = false;

  /// FOR BUTTON PILIHAN "METODE PENGIRIMAN OTP"
  bool sendOTPViaSMS = false;
  bool sendOTPViaWhatsApp = false;

  @override
  void initState() {
    super.initState();

    // Set waktu akhir, contoh 1 menit dari waktu sekarang
    endTime = DateTime.now().add(const Duration(minutes: 5));

    getStoredNoHp();

    // Mulai timer mundur
/*    timer = Timer.periodic(const Duration(seconds: 0), (Timer t) {
      setState(() {

      });
    })*/
    ;
  }

  Future<void> getStoredNoHp() async {
    // Retrieve the phone number (noHp) from secure storage
    String? noHp = await secureStorage.read(key: 'nomorHp');

    setState(() {
      storedNoHp = noHp;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n <= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    // Hentikan timer saat widget di-dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Duration remainingTime = endTime.difference(DateTime.now());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgOTPPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgOTPPages,
        title: const Text(
          'Verifikasi',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PINLogin()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonHelpButton,
                side: BorderSide(color: assetsColor.borderHelpButton),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              icon: Icon(Icons.live_help_outlined,
                  color: assetsColor.textHelpButton),
              label: Text(
                'Bantuan',
                style: TextStyle(color: assetsColor.textHelpButton),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                'Masukkan kode OTP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textOTPArea),
              ),
            ),

            /// SUB TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                'Cek kotak pesan SMS kamu untuk melihat kode\n'
                'OTP yang kami kirimkan ke nomor',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: assetsColor.textOTPArea),
              ),
            ),

            /// PHONE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Text(
                '+62 818*****673',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: assetsColor.textOTPArea),
              ),
            ),

            /// OTP FIELD
            Container(
              margin: const EdgeInsets.fromLTRB(60, 5, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OTPTextField(
                    controller: otpRegisterController,
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
                      setState(() {
                        textRotate =
                            storedNoHp! + constant.delimeterRegistration + pin;

                        rotatedText = Rotasi.rotateText(textRotate, 15);

                        data_nilai = base64Encode(utf8.encode(rotatedText));
                      });

                      // if (pin.length == 6) {
                      //   logicApi.verifyOTPRegistrasi(
                      //       context, data_nilai, constant.flagnewUser);
                      // }
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: OtpTimerButtonFunction(
                height: 40,
                onPressed: () {},
                text: const Text(
                  'Kirim Ulang',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                backgroundColor: Colors.indigo,
                duration: 120,
                radius: 5,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// AREA CONTENT BUTTON "Masuk dengan Google"
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Text(
                      'Kode OTP tidak masuk? Gunakan cara lain',
                      style: TextStyle(
                          fontSize: 15, color: assetsColor.textOTPArea),
                    ),
                  ),

                  /// AREA BUTTON "Metode pengiriman OTP"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ModalBottomOTPContent(
                                    updateSelection:
                                        (bool viaSMS, bool viaWhatsApp) {
                                      setState(() {
                                        sendOTPViaSMS = viaSMS;
                                        sendOTPViaWhatsApp = viaWhatsApp;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  assetsColor.buttonOtpMethodButton,
                              side: BorderSide(
                                  color: assetsColor.borderOtpMethodButton),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        sendOTPViaWhatsApp
                                            ? FontAwesomeIcons.whatsapp
                                            : Icons.message_outlined,
                                        color: sendOTPViaWhatsApp
                                            ? Colors.lightGreen
                                            : assetsColor.textOTPArea,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      sendOTPViaWhatsApp
                                          ? 'OTP dikirim ke WhatsApp'
                                          : 'OTP dikirim ke SMS',
                                      style: TextStyle(
                                          color: assetsColor.textOTPArea),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.expand_more,
                                  color: assetsColor.textOTPArea,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
