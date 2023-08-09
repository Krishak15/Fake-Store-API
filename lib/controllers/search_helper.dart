import 'package:fake_store/controllers/data_controller.dart';
import 'package:fake_store/models/datamodel.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';

import 'package:fake_store/services/services.dart';
import 'package:fake_store/utils/tiles.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:iconsax/iconsax.dart';

class SearchHelper extends SearchDelegate {
  final DataServices _itemList = DataServices();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
          // affects AppBar's background color
          titleTextStyle: TextStyle(fontSize: 18)),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(
          Iconsax.close_circle,
          color: Colors.black,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final itemController = Get.put(DataController());
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: FutureBuilder<List<DataModel>>(
          future: _itemList.getService(query: query),
          builder: (context, snapshot) {
            var data = snapshot.data;

            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  var ind = _itemList.results[index];
                  final itemdata =
                      itemController.dataModels[ind.id!.toInt() - 1];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // print(ind.id!.toInt());

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ItemDetailsView(
                                  titlee: itemdata.title.toString(),
                                  productId: itemdata.id,
                                  description: itemdata.description.toString(),
                                  image: itemdata.image.toString(),
                                  price: itemdata.price.toString(),
                                  rating: itemdata.rating!.rate.toString(),
                                  category: itemdata.category.toString(),
                                )));
                      },
                      child: MyTiles(
                          image: data![index].image.toString(),
                          title: data[index].title.toString(),
                          price: data[index].price.toString(),
                          rate: data[index].rating!.rate.toString()),
                    ),
                  );
                });
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
        child: Icon(
      Iconsax.search_normal,
      size: 80,
      color: Colors.grey,
    ));
  }
}
