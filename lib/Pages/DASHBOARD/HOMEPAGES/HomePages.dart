import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/ArticleContent.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/DiscountCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/GridMenu.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/HelpPages.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/ImagesAds.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/MyCurrentLocation.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/ProgressCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/PromotionCard.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/QRScanScreen.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/SliderDiscount.dart';
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
  TextEditingController searchHomePagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white30,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchHomePagesController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Cari di Jasa Bantu...',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.search, color: Colors.black38),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        // Atur tinggi garis sesuai kebutuhan
                        width: 2.0,
                        // Lebar garis, Anda bisa atur sesuai kebutuhan
                        color: Colors.black12, // Warna garis
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.qr_code_scanner,
                          color: Colors.black45,
                        ),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRScanScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
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
                Icons.local_mall_outlined,
                color: Colors.black45,
              ),
            ),
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
        children: const [
          /// MY CURRENT LOCATION
          MyCurrentLocation(),

          /// SLIDER ADS IMAGES
          SliderImages(),

          /// PROMOTION CARD
          PromotionCard(),

          /// GRID MENU
          GridMenu(),

          /// PROGRESS CARD
          ProgressCard(),

          /// PROMO CARD
          DiscountCard(),

          /// IMAGES ADS
          ImagesAds(),

          /// RECOMMENDED GRID SERVICES CARD
          // RecommendedServices(),

          /// VENDOR CARD
          VendorCard(),

          /// SURROUNDING SERVICES CARD
          SurroundingServices(),

          /// SLIDER ADS
          SliderDiscount(),

          SizedBox(height: 10),

          /// ARTICLE CONTENT
          ArticleContent(),

          /// HELP SERVICES
          HelpPages(),
          //
        ],
      ),
    );
  }
}
