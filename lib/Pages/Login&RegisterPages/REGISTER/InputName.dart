import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';

AssetsColor assetsColor = AssetsColor();

class InputName extends StatefulWidget {
  const InputName({super.key});

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  //
  /// FOR 'NAMA'
  final TextEditingController _inputName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgRegisterPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgRegisterPages,
        title: Text(
          'Daftar',
          style: TextStyle(fontSize: 20, color: assetsColor.textRegisterArea),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // /// LOGO JASA BANTU BG WHITE
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          //   child: Image.asset(
          //     'assets/logo/logo_jasabantu_bgwhite.jpg',
          //     width: 115,
          //     height: 25,
          //   ),
          // ),

          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Masukkan Nama Lengkap Kamu Yuk',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textRegisterArea),
            ),
          ),

          // /// SUB TITLE TEXT
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          //   child: Text(
          //     'Masukkan nomor handphone kamu dan pastikan nomor kamu benar dan aktif',
          //     style: TextStyle(
          //       fontSize: 15,
          //       color: assetsColor.textRegisterArea,
          //     ),
          //   ),
          // ),

          /// "PHONE" TEXT FIELDS
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Center(
              child: TextField(
                controller: _inputName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  labelText: 'Masukkan Nama Kamu',
                  prefixIcon: Icon(Icons.account_circle_outlined,
                      color: assetsColor.textRegisterArea),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(),
          ),

          /// BUTTON "LANJUTKAN"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
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
    );
  }
}
