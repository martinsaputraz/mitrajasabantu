import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class SliderImages extends StatelessWidget {
  const SliderImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagesSlides = [
      'assets/images/SliderImages/SliderImages(1).png',
      'assets/images/SliderImages/SliderImages(2).png',
      'assets/images/SliderImages/SliderImages(3).png',
      'assets/images/SliderImages/SliderImages(4).png'
      // Tambahkan path gambar lain jika diperlukan
    ];

    final List<Widget> imagesSliders = imagesSlides
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
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
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
              items: imagesSliders,
            ),
          ),
        ),
      ),
    );
  }
}
