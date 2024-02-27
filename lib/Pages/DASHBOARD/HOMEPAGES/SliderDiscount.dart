import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SliderDiscount extends StatelessWidget {
  const SliderDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagesSlidesDiscount = [
      'assets/images/SliderImages/SliderImages(1).png',
      'assets/images/SliderImages/SliderImages(2).png',
      'assets/images/SliderImages/SliderImages(3).png',
      'assets/images/SliderImages/SliderImages(4).png'
      // Tambahkan path gambar lain jika diperlukan
    ];

    final List<Widget> imagesSlidersDiscount = imagesSlidesDiscount
        .map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList();

    final deviceSize = MediaQuery.of(context).size;

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 300,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: const Row(
              children: [
                Text(
                  'Ada diskon member baru 🍀',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // SizedBox(width: 5),
                // Icon(Icons.energy_savings_leaf)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.width,
              ),
              child: FlutterCarousel(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  disableCenter: true,
                  viewportFraction: deviceSize.width > 400.0 ? 0.9 : 1.0,
                  height: 150,
                  enableInfiniteScroll: true,
                  showIndicator: false,
                ),
                items: imagesSlidersDiscount,
              ),
            ),
          ),

          /// BUTTON "LIHAT SEMUA DISKON"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const OTPPages()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat semua diskon',
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
