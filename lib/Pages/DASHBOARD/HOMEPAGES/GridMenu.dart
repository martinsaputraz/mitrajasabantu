import 'package:flutter/material.dart';

class GridMenu extends StatefulWidget {
  const GridMenu({super.key});

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  /// LIST MENU GRID
  final List<Map<String, dynamic>> gridMenuItems = [
    {
      'gridMenuIcon': Icons.grid_view_rounded,
      'gridMenuText': 'Kategori',
      'gridMenuColor': Colors.purpleAccent,
      'gridMenuRoutes': '/home',
    },
    {
      'gridMenuIcon': Icons.credit_card,
      'gridMenuText': 'Perbankan',
      'gridMenuColor': Colors.blueAccent,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.fastfood,
      'gridMenuText': 'Makanan',
      'gridMenuColor': Colors.green,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.shopping_basket,
      'gridMenuText': 'Kebutuhan',
      'gridMenuColor': Colors.pinkAccent,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.health_and_safety,
      'gridMenuText': 'Kesehatan',
      'gridMenuColor': Colors.tealAccent,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.water_drop,
      'gridMenuText': 'Air',
      'gridMenuColor': Colors.green,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.fitness_center,
      'gridMenuText': 'Olahraga',
      'gridMenuColor': Colors.pink,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.assignment,
      'gridMenuText': 'Asuransi',
      'gridMenuColor': Colors.orangeAccent,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.car_rental,
      'gridMenuText': 'Kendaraan',
      'gridMenuColor': Colors.blue,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.healing,
      'gridMenuText': 'Perawatan',
      'gridMenuColor': Colors.brown,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.restaurant,
      'gridMenuText': 'Restoran',
      'gridMenuColor': Colors.pink,
      'gridMenuRoutes': '/cart',
    },
    {
      'gridMenuIcon': Icons.build_circle_outlined,
      'gridMenuText': 'Teknologi',
      'gridMenuColor': Colors.yellow,
      'gridMenuRoutes': '/cart',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GridView.builder(
        itemCount: gridMenuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 1,
          mainAxisSpacing: 30,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final item = gridMenuItems[index];
          return GridTile(
            child: GridMenuTile(
              gridMenuIcon: item['gridMenuIcon'],
              gridMenuText: item['gridMenuText'],
              gridMenuBoxColor: item['gridMenuColor'],
              onPressed: () {
                Navigator.pushNamed(context, item['gridMenuRoutes']);
              },
              gridMenuRoutes: item['gridMenuRoutes'],
            ),
          );
        },
      ),
    );
  }
}

class GridMenuTile extends StatelessWidget {
  final IconData gridMenuIcon;
  final String gridMenuText;
  final Color gridMenuBoxColor;
  final VoidCallback onPressed;
  final String gridMenuRoutes;

  const GridMenuTile({
    super.key,
    required this.gridMenuIcon,
    required this.gridMenuText,
    required this.gridMenuBoxColor,
    required this.onPressed,
    required this.gridMenuRoutes,
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
                color: gridMenuBoxColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                gridMenuIcon,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            gridMenuText,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
