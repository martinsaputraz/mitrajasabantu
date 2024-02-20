import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class ImagesSlide {
  ImagesSlide({
    required this.imagesSliderTitle,
    required this.imagesSliderHeight,
    required this.imagesSliderColor,
  });

  final Color imagesSliderColor;
  final double imagesSliderHeight;
  final String imagesSliderTitle;
}

var imagesSlides = List.generate(
  6,
  (index) => ImagesSlide(
    imagesSliderTitle: 'Slide ${index + 1}',
    imagesSliderHeight: 100.0 + index * 50,
    imagesSliderColor: Colors.primaries[index % Colors.primaries.length],
  ),
);

final List<Widget> imagesSliders = imagesSlides
    .map(
      (item) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            color: item.imagesSliderColor,
            width: double.infinity,
            height: item.imagesSliderHeight,
            child: Center(
              child: Text(
                item.imagesSliderTitle,
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

class SliderImages extends StatelessWidget {
  const SliderImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                indicatorMargin: 12.0,
                enableInfiniteScroll: true,
                // slideIndicator: const CircularSlideIndicator(),
              ),
              items: imagesSliders,
            ),
          ),
        ),
      ),
    );
  }
}
