import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/RESET_PHONE/OTPVerifyNewPhone.dart';

AssetsColor assetsColor = AssetsColor();

class SetNewPhone extends StatefulWidget {
  const SetNewPhone({super.key});

  @override
  State<SetNewPhone> createState() => _SetNewPhoneState();
}

class _SetNewPhoneState extends State<SetNewPhone> {
  //
  // /// FOR 'NOMOR HANDPHONE'
  // final TextEditingController setNewPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgLoginPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLoginPages,
        title: Text(
          'Atur Ulang',
          style: TextStyle(fontSize: 20, color: assetsColor.textSetPINArea),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Masukkan nomor HP barumu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textSetPINArea),
            ),
          ),

          /// SUB TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Text(
              'Pastikan nomor kamu benar karena kami akan mengirimkan kode OTP',
              style: TextStyle(fontSize: 15, color: assetsColor.textSetPINArea),
            ),
          ),

          /// "PHONE" TEXT FIELDS
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
                  border: const OutlineInputBorder(
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
                    // phoneNumberLogin = phone.completeNumber;
                  });
                },
                inputFormatters: const [],
              ),
            ),
          ),

          Expanded(
            child: Container(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// BUTTON "LANJUTKAN"
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPVerifyNewPhone()),
                      );
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
                          'Lanjutkan',
                          style: TextStyle(
                              color: assetsColor.textSavePINButton,
                              fontSize: 18),
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
    );
  }
}
