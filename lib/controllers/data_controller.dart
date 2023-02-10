import 'package:fake_store/models/datamodel.dart';
import 'package:fake_store/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var dataModels = <DataModel>[].obs;
  var loading = true.obs;
  getData() async {
    if (kDebugMode) {
      print('Getting data...');
    }
    try {
      loading.value = true;
      var datas = await DataServices().getService();
      dataModels.value = datas;
      loading.value = false;
    } catch (e) {
      Get.snackbar("Error", "$e");
      loading.value = false;
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
