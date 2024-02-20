import 'package:flutter/material.dart';

class ImagesAds extends StatefulWidget {
  const ImagesAds({super.key});

  @override
  State<ImagesAds> createState() => _ImagesAdsState();
}

class _ImagesAdsState extends State<ImagesAds> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/Ads_Images(1).png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
