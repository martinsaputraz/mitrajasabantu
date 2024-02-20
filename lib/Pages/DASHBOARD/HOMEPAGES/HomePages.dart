import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/ArticleContent.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/DiscountCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/GridMenu.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/HelpPages.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/MyCurrentLocation.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/ProgressCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/PromotionCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/SliderAds.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/SliderImages.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/SurroundingServicesCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/VendorCard.dart';

AssetsColor assetsColor = AssetsColor();

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  /// FOR "SEARCH"
  TextEditingController searchController = TextEditingController();

  ///
  int itemCount = 4;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          automaticallyImplyLeading: false,

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
                    decoration: InputDecoration(
                      hintText: 'Cari di Jasa Bantu...',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.black45),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black45,
                      ), onPressed: () {  },
                    ),
                    ),
                  ),
                ),
              ),

            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.local_mall_outlined,
                color: Colors.black45,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.receipt_outlined,
                color: Colors.black45,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.notifications,
            //     color: Colors.black45,
            //   ),
            // ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        cacheExtent: 100.0,
        children: [
          /// MY CURRENT LOCATION
          const MyCurrentLocation(),

          /// SLIDER ADS IMAGES
          const SliderImages(),

          /// PROMOTION CARD
          const PromotionCard(),

          /// GRID MENU
          const GridMenu(),

          /// PROGRESS CARD
          const ProgressCard(),

          /// PROMO CARD
          const DiscountCard(),

          /// IMAGES ADS
          //

          /// RECOMMENDED GRID SERVICES CARD
          //

          /// VENDOR CARD
          const VendorCard(),

          /// SURROUNDING SERVICES CARD
          const SurroundingServices(),

          /// SLIDER ADS
          SliderAds(),

          /// ARTICLE CONTENT
          const ArticleContent(),

          /// HELP SERVICES
          const HelpPages(),
          //
        ],

      ),
    );
  }
}
