import 'package:shopx/models/product.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message

      Get.snackbar('ERROR', 'Error fetching products');

      return null;
    }
  }
}
