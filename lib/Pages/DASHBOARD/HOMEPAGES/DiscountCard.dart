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
      'title': 'Express Elite',
      'location': 'Jakarta Barat',
      'serviceName': 'Jasa Foto Produk Profesional',
      'price': '80.000',
      'discountPercentage': '74%',
      'discountedPrice': '355.000',
      'rating': '4.8',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'title': 'Zenith Group Innovation',
      'location': 'Tangerang Selatan',
      'serviceName': 'Konsultasi Desain Rumah',
      'price': '150.000',
      'discountPercentage': '43%',
      'discountedPrice': '275.000',
      'rating': '4.9',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'title': 'Sonic Flare',
      'location': 'Bekasi Barat',
      'serviceName': 'Perawatan Wajah & Kuku',
      'price': '2.750.000',
      'discountPercentage': '55%',
      'discountedPrice': '5.200.000',
      'rating': '4.7',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                        child: DiscountCardWidget(cardDataDiscount: discountCardData[index]),
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

class CardWidget extends StatelessWidget {
  final Map<String, dynamic> cardData;

  CardWidget({Key? key, required this.cardData}) : super(key: key);

  bool showImage = true;

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
                    cardData['imagePath'],
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(10),
                        bottomRight: const Radius.circular(10),
                      ),
                      color: Colors.purpleAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Icon(Icons.star, color: Colors.white),
                        SizedBox(width: 5),
                        Text('4.8', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.brown.shade800,
                    backgroundImage:
                    showImage ? AssetImage(cardData['imagePath']) : null,
                    child: showImage ? null : const Text('EP'),
                  ),
                ),
                //
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Flexible(
                      child: Text(
                        cardData['title'],
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
                cardData['location'],
                textAlign: TextAlign.start,
                style: TextStyle(
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
                  cardData['serviceName'],
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
                    'Rp${cardData['price']}',
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
                    cardData['discountPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardData['discountedPrice']}',
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

class DiscountCardWidget extends StatelessWidget {
  final Map<String, dynamic> cardDataDiscount;

  DiscountCardWidget({Key? key, required this.cardDataDiscount}) : super(key: key);

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
                    cardDataDiscount['imagePath'],
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
                        Text(cardDataDiscount['rating'], style: const TextStyle(color: Colors.white)),
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
                    backgroundImage:
                    showProfilePictureDiscountCard ? AssetImage(cardDataDiscount['imagePath']) : null,
                    child: showProfilePictureDiscountCard ? null : const Text('EP'),
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
                        cardDataDiscount['title'],
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
                cardDataDiscount['location'],
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
                  cardDataDiscount['serviceName'],
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
                    'Rp${cardDataDiscount['price']}',
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
                    cardDataDiscount['discountPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardDataDiscount['discountedPrice']}',
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
