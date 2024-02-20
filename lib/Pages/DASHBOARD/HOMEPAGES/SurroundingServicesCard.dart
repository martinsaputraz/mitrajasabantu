import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurroundingServices extends StatefulWidget {
  const SurroundingServices({Key? key}) : super(key: key);

  @override
  State<SurroundingServices> createState() => _SurroundingServicesState();
}

class _SurroundingServicesState extends State<SurroundingServices> {
  List<Map<String, dynamic>> surroundingServicesData = [
    {
      'surroundingServicesTitle': 'Story Bots',
      'surroundingServicesLocation': 'Tangerang Selatan',
      'surroundingServicesPromoType': 'Promo Gajian',
      'surroundingServicesPromoBoxColor': Colors.deepOrange,
      'surroundingServicesName': 'Konsultasi Desain Interior Rumah, Kantor',
      'surroundingServicesTimesUsed': '25',
      'surroundingServicesPrice': '150.000',
      'surroundingServicesDiscountPercentage': '40%',
      'surroundingServicesDiscountedPrice': '275.000',
      'surroundingServicesRating': '4.9',
      'surroundingServicesImagePath':
          'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'surroundingServicesTitle': 'Again Faster',
      'surroundingServicesLocation': 'Jakarta Utara',
      'surroundingServicesPromoType': 'Promo Gajian',
      'surroundingServicesPromoBoxColor': Colors.deepOrange,
      'surroundingServicesName': 'Konsultasi Desain Interior Rumah, Kantor',
      'surroundingServicesTimesUsed': '39',
      'surroundingServicesPrice': '150.000',
      'surroundingServicesDiscountPercentage': '40%',
      'surroundingServicesDiscountedPrice': '275.000',
      'surroundingServicesRating': '5.0',
      'surroundingServicesImagePath':
          'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'surroundingServicesTitle': 'Anika Lifestyle Service',
      'surroundingServicesLocation': 'Jakarta Barat',
      'surroundingServicesPromoType': 'Promo Gajian',
      'surroundingServicesPromoBoxColor': Colors.purple,
      'surroundingServicesName': 'Konsultasi Desain Interior Rumah, Kantor',
      'surroundingServicesTimesUsed': '548',
      'surroundingServicesPrice': '150.000',
      'surroundingServicesDiscountPercentage': '40%',
      'surroundingServicesDiscountedPrice': '275.000',
      'surroundingServicesRating': '4.5',
      'surroundingServicesImagePath':
          'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'surroundingServicesTitle': 'Story Bots',
      'surroundingServicesLocation': 'Tangerang Selatan',
      'surroundingServicesPromoType': 'Promo Gajian',
      'surroundingServicesPromoBoxColor': Colors.purple,
      'surroundingServicesName': 'Konsultasi Desain Interior Rumah, Kantor',
      'surroundingServicesTimesUsed': '120',
      'surroundingServicesPrice': '150.000',
      'surroundingServicesDiscountPercentage': '40%',
      'surroundingServicesDiscountedPrice': '275.000',
      'surroundingServicesRating': '4.4',
      'surroundingServicesImagePath':
          'assets/images/Background_DiscountCard(1).jpg',
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
                      'Jasa di sekitar kamu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      'assets/icon/Icon_Home(1).jpg',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    surroundingServicesData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: SurroundingServicesWidget(
                          cardSurroundingServices:
                              surroundingServicesData[index]),
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

class SurroundingServicesWidget extends StatelessWidget {
  final Map<String, dynamic> cardSurroundingServices;

  SurroundingServicesWidget({Key? key, required this.cardSurroundingServices})
      : super(key: key);

  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 180,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// PROFILE IMAGE & BANNER AREA
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cardSurroundingServices['surroundingServicesImagePath'],
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
                        Text(
                            cardSurroundingServices[
                                'surroundingServicesRating'],
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
                    backgroundImage: showImage
                        ? AssetImage(cardSurroundingServices[
                            'surroundingServicesImagePath'])
                        : null,
                    child: showImage ? null : const Text('EP'),
                  ),
                ),
              ],
            ),

            /// MITRA'S NAME & MITRA'S LOCATION
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Flexible(
                      child: Text(
                        cardSurroundingServices['surroundingServicesTitle'],
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
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                cardSurroundingServices['surroundingServicesLocation'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),

            /// SERVICE AREA
            /// SERVICE'S PROMO TYPE
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 150,
                ),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: cardSurroundingServices[
                        'surroundingServicesPromoBoxColor'],
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.confirmation_num_outlined,
                      color: cardSurroundingServices[
                          'surroundingServicesPromoBoxColor'],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      cardSurroundingServices['surroundingServicesPromoType'],
                      style: TextStyle(
                          color: cardSurroundingServices[
                              'surroundingServicesPromoBoxColor']),
                    ),
                  ],
                ),
              ),
            ),

            /// SERVICE'S NAME
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Flexible(
                child: Text(
                  cardSurroundingServices['surroundingServicesName'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            /// TIMES SERVICE'S USED
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                children: [
                  Text(
                    '${cardSurroundingServices['surroundingServicesTimesUsed']}x',
                    style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'digunakan',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            /// PRICE AREA
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
                    'Rp${cardSurroundingServices['surroundingServicesPrice']}',
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
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.percent_rounded,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cardSurroundingServices[
                        'surroundingServicesDiscountPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardSurroundingServices['surroundingServicesDiscountedPrice']}',
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
