import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class MyTiles extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rate;

  const MyTiles(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    var widthS = MediaQuery.of(context).size.width;
    return Container(
        height: 120,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 0),
                        spreadRadius: 2,
                        blurRadius: 9,
                        color: Colors.grey.withOpacity(0.5))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(
                        image,
                      )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: widthS * 0.5,
                            child: Text(
                              title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        width: widthS * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$$price",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500, fontSize: 16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(rate,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                const Icon(
                                  Iconsax.star1,
                                  size: 22,
                                  color: Colors.yellow,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
