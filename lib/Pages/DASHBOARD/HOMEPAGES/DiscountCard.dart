import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class DiscountCard extends StatefulWidget {
  const DiscountCard({super.key});

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cardData = [
      {
        'bannerImage': 'assets/banner1.jpg',
        'profileImage': 'assets/profile1.jpg',
        'rating': 4.8,
        'storeName': 'Store ABC',
        'verified': true,
        'location': 'New York, USA',
        'title': 'Product Title 1',
        'price': '\$50',
        'discountText': '20% Off',
        'originalPrice': '\$60',
      },
      {
        'bannerImage': 'assets/banner2.jpg',
        'profileImage': 'assets/profile2.jpg',
        'rating': 4.5,
        'storeName': 'Store XYZ',
        'verified': false,
        'location': 'Paris, France',
        'title': 'Product Title 2',
        'price': '\$30',
        'discountText': '10% Off',
        'originalPrice': '\$35',
      },
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        return CardWidget(
          bannerImage: cardData[index]['bannerImage'],
          profileImage: cardData[index]['profileImage'],
          rating: cardData[index]['rating'],
          storeName: cardData[index]['storeName'],
          verified: cardData[index]['verified'],
          location: cardData[index]['location'],
          title: cardData[index]['title'],
          price: cardData[index]['price'],
          discountText: cardData[index]['discountText'],
          originalPrice: cardData[index]['originalPrice'],
        );
      },
    );
  }
}

class CardWidget extends StatelessWidget {
  final String bannerImage;
  final String profileImage;
  final double rating;
  final String storeName;
  final bool verified;
  final String location;
  final String title;
  final String price;
  final String discountText;
  final String originalPrice;

  CardWidget({
    super.key,
    required this.bannerImage,
    required this.profileImage,
    required this.rating,
    required this.storeName,
    required this.verified,
    required this.location,
    required this.title,
    required this.price,
    required this.discountText,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          // Banner Image
          Image.asset(
            bannerImage,
            width: double.infinity,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          // Profile Image
          Positioned(
            top: 16.0,
            left: 16.0,
            child: CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 20.0,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Informasi Toko
                Row(
                  children: <Widget>[
                    // Nama Toko dan Lokasi
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          storeName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              size: 16.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4.0),
                            Text(location),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Verified dan Rating
                    if (verified)
                      const Icon(
                        Icons.verified,
                        color: Colors.green,
                      ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Rating: $rating',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                // Judul Produk
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                // Harga dan Diskon
                Text(
                  "Mulai dari\n$price /pcs",
                  style: const TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  discountText,
                  style: const TextStyle(color: Colors.deepOrangeAccent),
                ),
                const SizedBox(height: 4.0),
                Text(
                  originalPrice,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
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
