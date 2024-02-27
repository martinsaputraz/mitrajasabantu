import 'package:flutter/material.dart';

class ArticleContent extends StatefulWidget {
  const ArticleContent({Key? key}) : super(key: key);

  @override
  State<ArticleContent> createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  List<Map<String, dynamic>> articleListViewData = [
    {
      'articleTitle': 'Apa itu efek rumah kaca? Dampak dan Penyebabnya',
      'articleCategory': 'Rumah',
      'articleImages': 'assets/images/ArticlePages/Article(1).png',
      'articleRoutes': '/articleRoutes',
    },
    {
      'articleTitle': 'Hal yang Harus Diperhatikan Kalau Cari Mobil Bekas',
      'articleCategory': 'Kendaraan',
      'articleImages': 'assets/images/ArticlePages/Article(2).png',
      'articleRoutes': '/articleRoutes',
    },
    {
      'articleTitle': 'Ini 10 Tips Perawatan Diri untuk Perempuan',
      'articleCategory': 'Perawatan',
      'articleImages': 'assets/images/ArticlePages/Article(3).png',
      'articleRoutes': '/articleRoutes',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      constraints: const BoxConstraints(
        maxHeight: 620,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ARTICLE TITLE CONTENT
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: const Row(
              children: [
                Icon(Icons.menu_book_outlined),
                SizedBox(width: 5),
                Text(
                  'Artikel',
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
              'Artikel yang mempermudah hidupmu',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: const Text(
              'Informasi lengkap dan menarik tentang keperluan rumah atau pribadi ada disini',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),

          /// "ARTICLE" LIST VIEW
          Container(
            child: Expanded(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(
                  thickness: 0.1,
                ),
                itemCount: articleListViewData.length,
                itemBuilder: (context, index) {
                  final articleData = articleListViewData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        articleData['articleRoutes'],
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articleData['articleTitle'],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    articleData['articleCategory'],
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              articleData['articleImages'],
                              height: 100,
                              width: 120,
                              fit: BoxFit.cover,
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

          /// BUTTON "LIHAT SEMUA"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const OTPPages()),
                  // );
                },
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
