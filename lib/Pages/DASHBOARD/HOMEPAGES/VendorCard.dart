import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorCard extends StatefulWidget {
  const VendorCard({Key? key}) : super(key: key);

  @override
  State<VendorCard> createState() => _VendorCardState();
}

class _VendorCardState extends State<VendorCard> {

  List<Map<String, dynamic>> vendorCardData = [
    {
      'bannerPictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'profilePictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'title': 'Anika Service Lifestyle',
      'location': 'Jakarta Barat',
      'rating': '4.9',
      'totalFollowers': '500+',
    },
    {
      'bannerPictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'profilePictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'title': 'Fleify Landscape',
      'location': 'Surabaya',
      'rating': '4.6',
      'totalFollowers': '6,2K+',
    },
    {
      'bannerPictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'profilePictVendor': 'assets/images/Background_DiscountCard(1).jpg',
      'title': 'Jennifer Andrea',
      'location': 'Tangerang Selatan',
      'rating': '4.7',
      'totalFollowers': '8,6K+',
    },

    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.shopping_bag_outlined),
                          SizedBox(width: 5),
                          Text(
                            'Vendor',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Text(
                            'Vendor pilihan untuk kebutuhanmu',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.star),
                        ],
                      ),
                      Container(
                        child: const Text(
                          'Informasi lengkap dan menarik tentang keperluan rumah atau pribadi ada disini',
                          style: TextStyle(
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      vendorCardData.length,
                          (index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: SurroundingServicesWidget(
                            cardDataVendor: vendorCardData[index]),
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
  final Map<String, dynamic> cardDataVendor;

  SurroundingServicesWidget({Key? key, required this.cardDataVendor})
      : super(key: key);

  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 180,
          maxHeight: 300,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// PROFILE IMAGE & BANNER AREA
            Stack(
              // clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cardDataVendor['bannerPictVendor'],
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 45),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.brown.shade800,
                      backgroundImage: showImage
                          ? AssetImage(cardDataVendor['profilePictVendor'])
                          : null,
                      child: showImage ? null : const Text('EP'),
                    ),
                  ),
                ),
              ],
            ),

            /// MITRA'S NAME & MITRA'S LOCATION
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Flexible(
                        child: Text(
                          cardDataVendor['title'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 40),
              child: Text(
                cardDataVendor['location'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// RATING AREA
            Container(
              padding: const EdgeInsets.all(5),
              constraints: const BoxConstraints(
                maxWidth: 150,
              ),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cardDataVendor['rating'],
                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${cardDataVendor['totalFollowers']})',
                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
