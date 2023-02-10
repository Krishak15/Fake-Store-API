import 'package:fake_store/constants.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'package:iconsax/iconsax.dart';
import 'package:share_plus/share_plus.dart';

class ItemDetailsView extends StatefulWidget {
  final int? productId;
  final String? titlee;
  final String? description;
  final String? image;
  final String? price;
  final String? rating;
  final String? category;
  String? upperCased;

  ItemDetailsView(
      {super.key,
      this.category,
      this.upperCased,
      this.titlee,
      this.productId,
      this.description,
      this.image,
      this.price,
      this.rating});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  void upperCaseFirstLetter() {
    String firstLetterUpper =
        widget.category![0].toUpperCase() + widget.category!.substring(1);

    widget.upperCased = firstLetterUpper;
  }

  @override
  void initState() {
    upperCaseFirstLetter();
    super.initState();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height * 0.35;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawer: myDrawer,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const SizedBox(),
        title: Center(
          child: Neumorphic(
            style:
                const NeumorphicStyle(boxShape: NeumorphicBoxShape.stadium()),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    widget.upperCased.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                  ),
                )),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 15, top: 15),
              child: NeumorphicButton(
                onPressed: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                provideHapticFeedback: true,
                style: NeumorphicStyle(
                    shadowLightColor: Colors.white.withOpacity(0.6),
                    color: Colors.white,
                    boxShape: const NeumorphicBoxShape.circle()),
                child: Icon(
                  Icons.menu_rounded,
                  color: Colors.grey[800],
                  size: 30,
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 15.0, bottom: 15, top: 15),
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                provideHapticFeedback: true,
                style: NeumorphicStyle(
                    shadowLightColor: Colors.white.withOpacity(0.6),
                    color: Colors.white,
                    boxShape: const NeumorphicBoxShape.circle()),
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.grey[800],
                  size: 30,
                ),
              )),
        ],
      ),
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: width * 0.8,
                          child: Text(
                            widget.titlee.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: FlipCard(
                    front: Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.image.toString())),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                  color: Colors.grey.withOpacity(0.5))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: NeumorphicButton(
                          tooltip: "Share Image",
                          onPressed: (() async {
                            var titleS = widget.titlee.toString();

                            await Share.share(widget.image.toString(),
                                subject: "Look at this $titleS");
                          }),
                          provideHapticFeedback: true,
                          minDistance: -10,
                          style: const NeumorphicStyle(
                              depth: 4,
                              intensity: 0.5,
                              color: Colors.white,
                              surfaceIntensity: 0.3,
                              shape: NeumorphicShape.convex,
                              lightSource: LightSource.topLeft,
                              shadowDarkColor: Colors.black,
                              boxShape: NeumorphicBoxShape.circle()),
                          child: const Icon(
                            Icons.share_rounded,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                    ]),
                    back: Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 3,
                                color: Colors.grey.withOpacity(0.5))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                        child: Text(
                          widget.upperCased.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              upperCaseFirstLetter();
                            },
                            child: Text(
                              "\$${widget.price}",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            widget.rating.toString(),
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Icon(
                            Iconsax.star1,
                            size: 30,
                            color: Colors.yellow,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.8,
                        child: Text(
                          widget.description.toString(),
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 40,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
