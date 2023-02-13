import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class GridMode extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rate;

  const GridMode(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 7,
            offset: Offset(0, 3),
            color: Colors.grey.withOpacity(0.6))
      ], color: Colors.white, borderRadius: BorderRadius.circular(25)),
      height: 150,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(0.3))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.contain, image: NetworkImage(image)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 5),
            child: Row(
              children: [
                Container(
                  width: 150,
                  child: Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$$price",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                Row(
                  children: [
                    Text(rate,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    const Icon(
                      Iconsax.star1,
                      size: 22,
                      color: Colors.yellow,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
