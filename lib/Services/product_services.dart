import 'dart:convert';

import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:domestore/Services/api.dart';

class ProductServices {
  static Future<List<Product>?> getMostSellingProduct() async {
    List<Product>? products;
    final res = await Api.get('products');
    if (res.statusCode == 200) {
      final productResponse = ProductResponse.fromJson(jsonDecode(res.body));
      if(productResponse.products.isNotEmpty){
        products=productResponse.products.getRange(0, 10).toList();
      }
    }
    return products;
  }
    static Future<List<Product>?> getAllProduct() async {
    List<Product>? products;
    final res = await Api.get('products');
    if (res.statusCode == 200) {
      final productResponse = ProductResponse.fromJson(jsonDecode(res.body));
      if(productResponse.products.isNotEmpty){
        products=productResponse.products.getRange(0, 10).toList();
      }
    }
    return products;
  }
}
