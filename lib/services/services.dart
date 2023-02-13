import 'dart:convert';

import 'package:fake_store/models/datamodel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataServices {
  //list for search
  var lData = [];
  List<DataModel> results = [];

  var url = "https://fakestoreapi.com/products";
  Future<List<DataModel>> getService({String? query}) async {
    var response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        lData = jsonDecode(response.body);
        results = lData.map((e) => DataModel.fromJson(e)).toList();

        //for search helper
        if (query != null) {
          results = results
              .where((element) =>
                  element.title!.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }

        // return dataModelFromJson(response.body);
      } else {
        if (kDebugMode) {
          print('API error: ${response.statusCode}');
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
    }
    return results;
  }
}
