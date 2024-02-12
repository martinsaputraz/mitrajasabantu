import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/DiscountCard.dart';
import 'package:jasa_bantu/Settings/AssetsColor.dart';
import 'package:jasa_bantu/Settings/constant.dart';

Constant constants = Constant();
AssetsColor assetsColor = AssetsColor();

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  /// FOR "SEARCH"
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.lightGreen,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.document_scanner_outlined,
              color: Colors.white,
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
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
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
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.receipt_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// SLIDE SHOW

            /// CATEGORY MENU

            /// ADS BANNER
            /// HORIZONTAL PAGE VIEW
            /// "REKOMENDASI" HORIZONTAL PAGE VIEW
            /// "JASA DISEKITAR" HORIZONTAL PAGE VIEW
            /// "VENDOR" HORIZONTAL PAGE VIEW
            /// "ADS DISCOUNT" HORIZONTAL PAGE VIEW
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: const DiscountCard(),
            ),

            /// ARTICLE
            /// BANTUAN
          ],
        ),
      ),
    );
  }
}
