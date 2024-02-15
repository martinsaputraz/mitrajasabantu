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
      'title': 'Story Bots',
      'location': 'Tangerang Selatan',
      'promoType': 'Promo Gajian',
      'promoBoxColor': Colors.deepOrange,
      'serviceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'timesServicesUsed': '25',
      'price': '150.000',
      'discountPercentage': '40%',
      'discountedPrice': '275.000',
      'rating': '4.9',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'title': 'Again Faster',
      'location': 'Jakarta Utara',
      'promoType': 'Promo Gajian',
      'promoBoxColor': Colors.deepOrange,
      'serviceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'timesServicesUsed': '39',
      'price': '150.000',
      'discountPercentage': '40%',
      'discountedPrice': '275.000',
      'rating': '5.0',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'title': 'Anika Lifestyle Service',
      'location': 'Jakarta Barat',
      'promoType': 'Promo Gajian',
      'promoBoxColor': Colors.purple,
      'serviceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'timesServicesUsed': '548',
      'price': '150.000',
      'discountPercentage': '40%',
      'discountedPrice': '275.000',
      'rating': '4.5',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    {
      'title': 'Story Bots',
      'location': 'Tangerang Selatan',
      'promoType': 'Promo Gajian',
      'promoBoxColor': Colors.purple,
      'serviceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'timesServicesUsed': '120',
      'price': '150.000',
      'discountPercentage': '40%',
      'discountedPrice': '275.000',
      'rating': '4.4',
      'imagePath': 'assets/images/Background_DiscountCard(1).jpg',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        'assets/icons/Icon_Home(1).jpg',
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
      ),
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
                    cardSurroundingServices['imagePath'],
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
                        Text(cardSurroundingServices['rating'],
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
                        ? AssetImage(cardSurroundingServices['imagePath'])
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
                        cardSurroundingServices['title'],
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
                cardSurroundingServices['location'],
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
                    color: cardSurroundingServices['promoBoxColor'],
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.confirmation_num_outlined,
                      color: cardSurroundingServices['promoBoxColor'],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      cardSurroundingServices['promoType'],
                      style: TextStyle(
                          color: cardSurroundingServices['promoBoxColor']),
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
                  cardSurroundingServices['serviceName'],
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
                    '${cardSurroundingServices['timesServicesUsed']}x',
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
                    'Rp${cardSurroundingServices['price']}',
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
                    cardSurroundingServices['discountPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardSurroundingServices['discountedPrice']}',
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
