import 'package:fake_store/services/services.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// ignore: must_be_immutable
class SearchItems extends StatefulWidget {
  String? title;
  String? image;
  String? rating;
  String? price;

  SearchItems({super.key, this.title, this.image, this.rating, this.price});

  @override
  State<SearchItems> createState() => _SearchItemsState();
}

class _SearchItemsState extends State<SearchItems> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Neumorphic(
                style: const NeumorphicStyle(
                    color: Colors.white,
                    boxShape: NeumorphicBoxShape.stadium()),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28),
                              borderSide: const BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28)),
                          fillColor: Colors.white,
                          focusColor: Colors.white),
                    ),
                  ),
                )),
          ),
          leading: const SizedBox(),
          toolbarHeight: 100,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, bottom: 19, top: 19),
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
          ]),
    );
  }
}
