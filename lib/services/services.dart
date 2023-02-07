import 'package:fake_store/models/datamodel.dart';
import 'package:http/http.dart' as http;

class DataServices {
  var Url = "https://fakestoreapi.com/products";
  Future<List<DataModel>?> getService() async {
    var response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      return dataModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
