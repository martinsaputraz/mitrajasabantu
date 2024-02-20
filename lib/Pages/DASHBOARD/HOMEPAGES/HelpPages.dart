import 'package:flutter/material.dart';

class HelpPages extends StatefulWidget {
  const HelpPages({Key? key}) : super(key: key);

  @override
  State<HelpPages> createState() => _HelpPagesState();
}

class _HelpPagesState extends State<HelpPages> {

  List<Map<String, dynamic>> bantuanListViewData = [
    {
      'bantuanTitle': 'Cara menyewa jasa',
      'bantuanSubTitle': 'Anti ribet, simak caranya di sini',
      'bantuanImages': 'assets/images/Background_DiscountCard(1).jpg',
      'bantuanRoutes': '/bantuanRoutes',
    },
    {
      'bantuanTitle': 'Cara menawarkan jasa kamu 🤑',
      'bantuanSubTitle': 'Daftar dan dapatkan pendapatan lebih',
      'bantuanImages': 'assets/images/Background_DiscountCard(1).jpg',
      'bantuanRoutes': '/bantuanRoutes',
    },
    {
      'bantuanTitle': 'Butuh bantuan? Hubungi kami',
      'bantuanSubTitle': 'Jangan bingung, Kami siap bantu',
      'bantuanImages': 'assets/images/Background_DiscountCard(1).jpg',
      'bantuanRoutes': '/bantuanRoutes',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        // constraints: const BoxConstraints(
        //   maxHeight: 300,
        // ),
        // decoration: const BoxDecoration(
        //   color: Colors.white,
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BANTUAN TITLE CONTENT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: const Row(
                children: [
                  Icon(Icons.help_outline),
                  SizedBox(width: 5),
                  Text(
                    'Bantuan',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: const Text(
                'Pusat bantuan untukmu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: const Text(
                'Informasi lengkap dan menarik tentang keperluan',
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
            ),

            /// "BANTUAN" LIST VIEW
            Container(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  // Tambahkan padding di sini
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: bantuanListViewData.length,
                    itemBuilder: (context, index) {
                      final bantuanData = bantuanListViewData[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            bantuanData['bantuanRoutes'],
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  bantuanData['bantuanImages'],
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bantuanData['bantuanTitle'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        bantuanData['bantuanSubTitle'],
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            //
          ],
        ),
      );
  }
}
