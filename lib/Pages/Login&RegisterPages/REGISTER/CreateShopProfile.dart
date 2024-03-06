import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/CreateShopProfilePict.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/OTPEmailVerifyRegister.dart';
import 'package:jasa_bantu/Settings/constant.dart';

AssetsColor assetsColor = AssetsColor();

class CreateShopProfile extends StatefulWidget {
  const CreateShopProfile({super.key});

  @override
  State<CreateShopProfile> createState() => _CreateShopProfileState();
}

class _CreateShopProfileState extends State<CreateShopProfile> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Constant constant = Constant();

  //
  /// FOR 'NAMA'
  final TextEditingController _inputName = TextEditingController();
  String? ID;

  String? storedNoHp;
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";

  @override
  void initState() {
    // TODO: implement initState
    getStorageID();
    super.initState();
  }

  Future<void> getStorageID() async {
    // Retrieve the phone number (noHp) from secure storage
    ID = await secureStorage.read(key: 'ID');
    storedNoHp = await secureStorage.read(key: 'nomorHp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgRegisterPages,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: assetsColor.bgRegisterPages,
        title: Text(
          'Buat Profil Toko',
          style: TextStyle(fontSize: 20, color: assetsColor.textRegisterArea),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Column(
              children: [
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Nama Toko',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Nama akun utama',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'No. handphone',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Email',
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const OTPEmailVerifyRegister()));
                  },
                ),
              ],
            ),
          ),

          Divider(
            thickness: 10,
            color: Colors.grey[100],
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: Column(
              children: [
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Ajukan verifikasi toko',
                    style: TextStyle(
                        // color: Colors.black45,
                        ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Atur jadwal operasional toko',
                    style: TextStyle(
                        // color: Colors.black45,
                        ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
                ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.black45,
                  ),
                  title: const Text(
                    'Atur lokasi toko dan jangkauan jasa',
                    style: TextStyle(
                        // color: Colors.black45,
                        ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //         const ChangePassword()));
                  },
                ),
              ],
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
                  //
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateShopProfilePict()),
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
