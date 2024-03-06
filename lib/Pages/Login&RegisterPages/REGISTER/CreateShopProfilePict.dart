import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Settings/constant.dart';

AssetsColor assetsColor = AssetsColor();

class CreateShopProfilePict extends StatefulWidget {
  const CreateShopProfilePict({super.key});

  @override
  State<CreateShopProfilePict> createState() => _CreateShopProfilePictState();
}

class _CreateShopProfilePictState extends State<CreateShopProfilePict> {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Constant constant = Constant();

  ///
  bool isProfilePictAble = true;
  bool isBannerPictAble = true;

  List<Map<String, dynamic>> shopProfileBannerPict = [
    {
      'shopProfilePict': '',
      // assets/images/CardImages/Card_ProfileImages(2).png
      'shopBannerPict': '',
      // assets/images/CardImages/Card_BannerImages(6).png
    },
    // Add more data entries as needed
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgRegisterPages,
      appBar: AppBar(
        backgroundColor: assetsColor.bgRegisterPages,
        title: Text(
          'Buat Profil Toko',
          style: TextStyle(fontSize: 20, color: assetsColor.textRegisterArea),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// PROFILE PHOTO
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[500],
                    backgroundImage: isProfilePictAble &&
                            shopProfileBannerPict[0]['shopProfilePict']
                                .isNotEmpty
                        ? AssetImage(
                            shopProfileBannerPict[0]['shopProfilePict'],
                          )
                        : null,
                    child: isProfilePictAble &&
                            shopProfileBannerPict[0]['shopProfilePict'].isEmpty
                        ? const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 30,
                          )
                        : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: const Text(
                      'Tambah foto',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Foto profil dan banner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'Foto dan banner yang menarik membuat penyewa menjadi lebih tertarik',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),

          /// BANNER PHOTO
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  height: 150,
                  child: isBannerPictAble &&
                          shopProfileBannerPict[0]['shopBannerPict'].isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            shopProfileBannerPict[0]['shopBannerPict'],
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                ),

                ///
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.black12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: const Text(
                      'Tambah banner',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Foto profil dan banner',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'Foto dan banner yang menarik membuat penyewa menjadi lebih tertarik',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
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
                      'Simpan & selesai',
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
