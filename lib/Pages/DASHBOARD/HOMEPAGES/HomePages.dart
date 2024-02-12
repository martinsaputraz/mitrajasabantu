import 'package:flutter/material.dart';
// import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/DiscountCard.dart';
import 'package:jasa_bantu/Settings/AssetsColor.dart';


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
      backgroundColor: Colors.black12,
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
              //
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
        children: const [
          /// MY CURRENT LOCATION
          // MyCurrentLocation(),

          /// SLIDER ADS IMAGES
          // SliderImages(),

          /// PROMO CARD
          DiscountCard(),

          /// GRID MENU
          // GridMenu(),

          ///

          //
        ],
      ),
    );
  }
}
