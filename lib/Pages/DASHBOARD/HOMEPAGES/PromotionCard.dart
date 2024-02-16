import 'package:flutter/material.dart';

class PromotionCard extends StatefulWidget {
  const PromotionCard({super.key});

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
  /// LIST DATA PROMO CARD
  List<Map<String, dynamic>> cardData = [
    {
      'title': 'Salon Anabul Kesayangan',
      'promoText': 'Promo 50%',
      'imagePath': 'assets/images/Ads(1).jpg',
      'promoColorBox' : Colors.blue,
      'backgroundColor': Colors.blue[200],
    },
    {
      'title': 'Salon Anabul Kesayangan',
      'promoText': 'Gratis Ongkir',
      'imagePath': 'assets/images/Ads(1).jpg',
      'promoColorBox' : Colors.deepOrange,
      'backgroundColor': Colors.deepOrange[200],
    },
    {
      'title': 'Salon Anabul Kesayangan',
      'promoText': 'Promo 50%',
      'imagePath': 'assets/images/Ads(1).jpg',
      'promoColorBox' : Colors.amber,
      'backgroundColor': Colors.amber[200],
    },
    {
      'title': 'Salon Anabul Kesayangan',
      'promoText': 'Promo 50%',
      'imagePath': 'assets/images/Ads(1).jpg',
      'promoColorBox' : Colors.green,
      'backgroundColor': Colors.green[200],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            // Menentukan lebar maksimum setiap item dalam grid
            mainAxisSpacing: 5,
            // Spasi antara item dalam arah utama (vertikal)
            crossAxisSpacing: 5,
            // Spasi antara item dalam arah silang (horizontal)
            childAspectRatio:
                2, // Rasio aspek dari setiap item dalam grid (lebar / tinggi)
          ),
          itemCount: cardData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: cardData[index]['backgroundColor'],
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  maxWidth: 200,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                          ),
                          child: Text(
                            cardData[index]['title'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: cardData[index]['promoColorBox'],
                          ),
                          child: Text(
                            cardData[index]['promoText'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset(
                        cardData[index]['imagePath'],
                        fit: BoxFit.cover,
                        height: 100,
                        width: 60,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
