import 'dart:async';

import 'package:fake_store/constants.dart';
import 'package:fake_store/controllers/data_controller.dart';
import 'package:fake_store/responsive_layouts/mobile/itemdetails_mobile.dart';
import 'package:fake_store/utils/tiles.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MobileScaffol extends StatefulWidget {
  const MobileScaffol({super.key});

  @override
  State<MobileScaffol> createState() => _MobileScaffolState();
}

class _MobileScaffolState extends State<MobileScaffol> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  Future<void> _refreshHandler() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    var getDat = DataController();

    setState(() {
      getDat.getData();
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          dismissDirection: DismissDirection.down,
          backgroundColor: Colors.green[100],
          content: const Text(
            'Refresh complete',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          // action: SnackBarAction(
          //   textColor: Colors.red[700],
          //   label: 'RETRY?',
          //   onPressed: () {
          //     _refreshIndicatorKey.currentState!.show();
          //   },
          // ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemController = Get.put(DataController());
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: defBgColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: LiquidPullToRefresh(
        springAnimationDurationInMilliseconds: 1500,
        animSpeedFactor: 2,
        color: Colors.transparent,
        showChildOpacityTransition: false,
        key: _refreshIndicatorKey,
        onRefresh: _refreshHandler,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white70.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
              child: Obx(() {
                return itemController.loading.isTrue
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: itemController.dataModels.length,
                        itemBuilder: (context, index) {
                          final itemdata = itemController.dataModels[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ItemDetailsView(
                                          titlee: itemdata.title.toString(),
                                          productId: itemdata.id,
                                          description:
                                              itemdata.description.toString(),
                                          image: itemdata.image.toString(),
                                          price: itemdata.price.toString(),
                                          rating:
                                              itemdata.rating!.rate.toString(),
                                          category:
                                              itemdata.category.toString(),
                                        )));
                              },
                              child: MyTiles(
                                  image: itemdata.image.toString(),
                                  title: itemdata.title.toString(),
                                  price: itemdata.price.toString(),
                                  rate: itemdata.rating!.rate.toString()),
                            ),
                          );
                        });
              })),
        ),
      ),
    );
  }
}
