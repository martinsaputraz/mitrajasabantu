import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class DiscountCard extends StatefulWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  List<Map<String, dynamic>> discountCardData = [
    {
      'discountCardTitle': 'Express Elite',
      'discountCardLocation': 'Jakarta Barat',
      'discountCardServiceName': 'Jasa Foto Produk Profesional',
      'discountCardPrice': '80.000',
      'discountCardPercentage': '74%',
      'discountedCardPrice': '355.000',
      'discountCardRating': '4.8',
      'discountCardImagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'discountCardTitle': 'Zenith Group Innovation',
      'discountCardLocation': 'Tangerang Selatan',
      'discountCardServiceName': 'Konsultasi Desain Rumah',
      'discountCardPrice': '150.000',
      'discountCardPercentage': '43%',
      'discountedCardPrice': '275.000',
      'discountCardRating': '4.9',
      'discountCardImagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'discountCardTitle': 'Sonic Flare',
      'discountCardLocation': 'Bekasi Barat',
      'discountCardServiceName': 'Perawatan Wajah & Kuku',
      'discountCardPrice': '2.750.000',
      'discountCardPercentage': '55%',
      'discountedCardPrice': '5.200.000',
      'discountCardRating': '4.7',
      'discountCardImagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    const Text(
                      'Kejar diskon setiap hari',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assets/icon/Icon_ShoppingBag_(Transparent).png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),

              //
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    discountCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: DiscountCardWidget(
                          cardDataDiscount: discountCardData[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DiscountCardWidget extends StatelessWidget {
  final Map<String, dynamic> cardDataDiscount;

  DiscountCardWidget({Key? key, required this.cardDataDiscount})
      : super(key: key);

  bool showProfilePictureDiscountCard = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 350,
          maxWidth: 200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cardDataDiscount['discountCardImagePath'],
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.purpleAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.star, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(cardDataDiscount['discountCardRating'],
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.brown.shade800,
                    backgroundImage: showProfilePictureDiscountCard
                        ? AssetImage(cardDataDiscount['discountCardImagePath'])
                        : null,
                    child: showProfilePictureDiscountCard
                        ? null
                        : const Text('EP'),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Flexible(
                      child: Text(
                        cardDataDiscount['discountCardTitle'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                cardDataDiscount['discountCardLocation'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Flexible(
                child: Text(
                  cardDataDiscount['discountCardServiceName'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Mulai dari',
                style: TextStyle(color: Colors.black45, fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Rp${cardDataDiscount['discountCardPrice']}',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' /pcs',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.percent_rounded,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cardDataDiscount['discountCardPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardDataDiscount['discountedCardPrice']}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
