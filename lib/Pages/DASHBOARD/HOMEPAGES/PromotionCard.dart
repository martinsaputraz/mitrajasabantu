import 'package:flutter/material.dart';

class PromotionCard extends StatefulWidget {
  const PromotionCard({super.key});

  @override
  State<PromotionCard> createState() => _PromotionCardState();
}

class _PromotionCardState extends State<PromotionCard> {
  /// LIST DATA PROMO CARD
  List<Map<String, dynamic>> promotionCardData = [
    {
      'promotionCardTitle': 'Salon Anabul Kesayangan',
      'promotionCardPromoType': 'Promo 50%',
      'promotionCardImagePath': 'assets/images/Ads(1).jpg',
      'promotionCardColorBox': Colors.blue,
      'promotionCardBGColor': Colors.blue[50],
    },
    {
      'promotionCardTitle': 'Salon Anabul Kesayangan',
      'promotionCardPromoType': 'Gratis Ongkir',
      'promotionCardImagePath': 'assets/images/Ads(1).jpg',
      'promotionCardColorBox': Colors.deepOrange,
      'promotionCardBGColor': Colors.deepOrange[50],
    },
    {
      'promotionCardTitle': 'Salon Anabul Kesayangan',
      'promotionCardPromoType': 'Promo 50%',
      'promotionCardImagePath': 'assets/images/Ads(1).jpg',
      'promotionCardColorBox': Colors.amber,
      'promotionCardBGColor': Colors.amber[50],
    },
    {
      'promotionCardTitle': 'Salon Anabul Kesayangan',
      'promotionCardPromoType': 'Promo 50%',
      'promotionCardImagePath': 'assets/images/Ads(1).jpg',
      'promotionCardColorBox': Colors.green,
      'promotionCardBGColor': Colors.green[50],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
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
        itemCount: promotionCardData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: promotionCardData[index]['promotionCardBGColor'],
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
                          promotionCardData[index]['promotionCardTitle'],
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
                          color: promotionCardData[index]
                              ['promotionCardColorBox'],
                        ),
                        child: Text(
                          promotionCardData[index]['promotionCardPromoType'],
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
                      promotionCardData[index]['promotionCardImagePath'],
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
    );
  }
}
