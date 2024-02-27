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
      'vendorCardBannerPict':
          'assets/images/CardImages/Card_BannerImages(9).png',
      'vendorCardProfilePict':
          'assets/images/CardImages/Card_ProfileImages(9).png',
      'vendorCardTitle': 'Anika Service Lifestyle',
      'vendorCardLocation': 'Jakarta Barat',
      'vendorCardRating': '4.9',
      'vendorCardTotalFollowers': '500+',
    },
    {
      'vendorCardBannerPict':
          'assets/images/CardImages/Card_BannerImages(8).png',
      'vendorCardProfilePict':
          'assets/images/CardImages/Card_ProfileImages(8).png',
      'vendorCardTitle': 'Fleify Landscape',
      'vendorCardLocation': 'Surabaya',
      'vendorCardRating': '4.6',
      'vendorCardTotalFollowers': '6,2K+',
    },
    {
      'vendorCardBannerPict':
          'assets/images/CardImages/Card_BannerImages(7).png',
      'vendorCardProfilePict':
          'assets/images/CardImages/Card_ProfileImages(7).png',
      'vendorCardTitle': 'Jennifer Andrea',
      'vendorCardLocation': 'Tangerang Selatan',
      'vendorCardRating': '4.7',
      'vendorCardTotalFollowers': '8,6K+',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                          'Vendor pilihan untuk kebutuhanmu 🤩',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(width: 5),
                        // Icon(Icons.star),
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
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      vendorCardData.length,
                      (index) => SurroundingServicesWidget(
                          cardDataVendor: vendorCardData[index]),
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
                    cardDataVendor['vendorCardBannerPict'],
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
                          ? AssetImage(cardDataVendor['vendorCardProfilePict'])
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
                          cardDataVendor['vendorCardTitle'],
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
                cardDataVendor['vendorCardLocation'],
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
                color: Colors.grey[200],
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
                    cardDataVendor['vendorCardRating'],
                    style: const TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '(${cardDataVendor['vendorCardTotalFollowers']})',
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
