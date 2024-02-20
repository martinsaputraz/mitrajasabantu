import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatefulWidget {
  const ProgressCard({super.key});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  //

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 200,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// "STATUS" PROGRESS CARD
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: const Row(
                      children: [
                        Icon(
                          CupertinoIcons.rays,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Diproses',
                          style:
                          TextStyle(color: Colors.blueAccent, fontSize: 15),
                        )
                      ],
                    ),
                  ),

                  /// "TITLE" PROGRESS CARD
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: const Text(
                      'Konsultasi dan Jasa Interior Rumah, Kantor, dan Taman',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),

                  /// "SUB TEXT MITRA ACCOUNT" PROGRESS CARD
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const Row(
                      children: [
                        Text(
                          'Kibana Home',
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: Container(),
                  ),

                  /// "TIMES TRANSACTION" PROGRESS CARD
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      color: Colors.lightBlue[100],
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Kemarin, 20.50 WIB',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                        Text(
                          '1H + 23:37:45',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// "LIHAT SEMUA PESANAN" BUTTON PROGRESS CARD
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Lihat semua pesanan',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}