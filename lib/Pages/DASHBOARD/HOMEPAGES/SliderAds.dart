import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Slide {
  Slide({
    required this.title,
    required this.height,
    required this.color,
  });

  final Color color;
  final double height;
  final String title;
}

var slides = List.generate(
  6,
      (index) => Slide(
    title: 'Slide ${index + 1}',
    height: 100.0 + index * 50,
    color: Colors.primaries[index % Colors.primaries.length],
  ),
);

final List<Widget> sliders = slides
    .map(
      (item) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      child: Container(
        color: item.color,
        width: double.infinity,
        height: item.height,
        child: Center(
          child: Text(
            item.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ),
)
    .toList();

class SliderAds extends StatelessWidget {
  SliderAds({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.black45,
            ),
            onPressed: () {
              // Handle QR code scanner button press
            },
          ),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: TextField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Cari di Jasa Bantu...',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black45),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Handle local mall button press
              },
              icon: const Icon(
                Icons.local_mall_outlined,
                color: Colors.black45,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle receipt button press
              },
              icon: const Icon(
                Icons.receipt_outlined,
                color: Colors.black45,
              ),
            ),
            IconButton(
              onPressed: () {
                // Handle menu button press
              },
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  'Ada diskon member baru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5),
                Icon(Icons.energy_savings_leaf)
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
                  indicatorMargin: 12.0,
                  enableInfiniteScroll: true,
                  slideIndicator: const CircularSlideIndicator(),
                ),
                items: sliders,
              ),
            ),
          ),

          /// BUTTON "LANJUTKAN"
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
                  backgroundColor: Colors.white24,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat semua diskon',
                      style: TextStyle(color: Colors.black54, fontSize: 18),
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
