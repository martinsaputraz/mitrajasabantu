import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.black45,
                  ),
                  Text(
                    'Rumah Saya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Flexible(
              child: Text(
                'Jl. In Aja Dulu, Baru Tau Nanti, Abcdefghijkl',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
            const Icon(Icons.expand_more_rounded),
          ],
        ),
      );
  }
}
