import 'package:flutter/material.dart';

class GridMenu extends StatefulWidget {
  const GridMenu({super.key});

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  /// LIST MENU GRID
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': Icons.grid_view_rounded,
      'text': 'Kategori',
      'color': Colors.purpleAccent,
      'route': '/home',
    },
    {
      'icon': Icons.credit_card,
      'text': 'Perbankan',
      'color': Colors.blueAccent,
      'route': '/cart',
    },
    {
      'icon': Icons.fastfood,
      'text': 'Makanan',
      'color': Colors.green,
      'route': '/cart',
    },
    {
      'icon': Icons.shopping_basket,
      'text': 'Kebutuhan',
      'color': Colors.pinkAccent,
      'route': '/cart',
    },
    {
      'icon': Icons.health_and_safety,
      'text': 'Kesehatan',
      'color': Colors.tealAccent,
      'route': '/cart',
    },
    {
      'icon': Icons.water_drop,
      'text': 'Air',
      'color': Colors.green,
      'route': '/cart',
    },
    {
      'icon': Icons.fitness_center,
      'text': 'Olahraga',
      'color': Colors.pink,
      'route': '/cart',
    },
    {
      'icon': Icons.assignment,
      'text': 'Asuransi',
      'color': Colors.orangeAccent,
      'route': '/cart',
    },
    {
      'icon': Icons.car_rental,
      'text': 'Kendaraan',
      'color': Colors.blue,
      'route': '/cart',
    },
    {
      'icon': Icons.healing,
      'text': 'Perawatan',
      'color': Colors.brown,
      'route': '/cart',
    },
    {
      'icon': Icons.restaurant,
      'text': 'Restoran',
      'color': Colors.pink,
      'route': '/cart',
    },
    {
      'icon': Icons.build_circle_outlined,
      'text': 'Teknologi',
      'color': Colors.yellow,
      'route': '/cart',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 1,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GridTile(
              child: MenuTile(
                icon: item['icon'],
                text: item['text'],
                boxColor: item['color'],
                onPressed: () {
                  Navigator.pushNamed(context, item['route']);
                },
                route: item['route'],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color boxColor;
  final VoidCallback onPressed;
  final String route;

  const MenuTile({
    super.key,
    required this.icon,
    required this.text,
    required this.boxColor,
    required this.onPressed,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: boxColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
