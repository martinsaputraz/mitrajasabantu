import 'package:flutter/material.dart';
import 'package:jasa_bantu/Assets/AssetsColor.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/HomePages.dart';

AssetsColor assetsColor = AssetsColor();

class DashboardPages extends StatefulWidget {
  const DashboardPages({super.key});

  @override
  State<DashboardPages> createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  /// FOR "MENU" AT BOTTOM NAVIGATION BAR
  int _selectedIndexMenuNavBar = 0;
  final List<Widget> _bottomMenuNavBar = [
    const HomePages(),
    // const ProductsPages(),
    // const OrderPages(),
    // const ChatPages(),
    // const ProfilePages(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: _bottomMenuNavBar[_selectedIndexMenuNavBar],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndexMenuNavBar,
        onTap: _onMenuNavBarItem,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Jasamu'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Pesanan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profil'),
        ],
      ),
    );
  }

  void _onMenuNavBarItem(int index) {
    setState(() {
      _selectedIndexMenuNavBar = index;
    });
  }
}
