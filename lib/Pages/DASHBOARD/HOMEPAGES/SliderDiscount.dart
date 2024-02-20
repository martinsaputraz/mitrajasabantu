import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class DiscountSlide {
  DiscountSlide({
    required this.discountSliderTitle,
    required this.discountSliderHeight,
    required this.discountSliderColor,
  });

  final Color discountSliderColor;
  final double discountSliderHeight;
  final String discountSliderTitle;
}

var discountSlides = List.generate(
  6,
  (index) => DiscountSlide(
    discountSliderTitle: 'Slide ${index + 1}',
    discountSliderHeight: 100.0 + index * 50,
    discountSliderColor: Colors.primaries[index % Colors.primaries.length],
  ),
);

final List<Widget> discountSliders = discountSlides
    .map(
      (item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            color: item.discountSliderColor,
            width: double.infinity,
            height: item.discountSliderHeight,
            child: Center(
              child: Text(
                item.discountSliderTitle,
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

class SliderDiscount extends StatelessWidget {
  const SliderDiscount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Ada diskon member baru',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 5),
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
                  // slideIndicator: const CircularSlideIndicator(),
                ),
                items: discountSliders,
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
                  backgroundColor: Colors.white70,
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
