import 'dart:convert';

import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'dummyjson.com';
  static Future<http.Response> get(String path,
      [Map<String, dynamic>? queryParameters]) async {
    final url = Uri.https(baseUrl, path);
    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  static Future<http.Response> addUser(
      String path, Map<String, dynamic> userData) async {
    final url = Uri.https(baseUrl, path);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  static Future<bool> loginUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('https://dummyjson.com/auth/login');

    // إعداد البيانات التي سيتم إرسالها في الطلب

    // إرسال الطلب باستخدام http.post
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    // التحقق من حالة الرد
    if (response.statusCode == 200) {
      // تحويل الرد إلى JSON إذا كان الطلب ناجحاً
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      print(responseData);
      return true;
    } else {
      // إذا كان الرد ليس 200، فهذا يعني أن هناك خطأ ما
      print('Failed to login: ${response.statusCode}');
      return false;
    }
  }

  Future<List<Product>> fetchProducts({int limit = 10, int skip = 0}) async {
    final response = await http
        .get(Uri.parse('$baseUrl?limit=$limit&skip=$skip&select=title,price'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List products = data['products'];
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

 static Future<List<Product>> fetchProductsByCategory(String path,String categoryName) async {
  
final url = Uri.https(baseUrl,'$path/:$categoryName');
final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List products = data['products'];
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load category products');
    }
  }

static   Future<List> fetchCategories(String path) async {
final url = Uri.https(baseUrl, path);
final response = await http.get(url);

    if (response.statusCode == 200) {
      List categories = json.decode(response.body);
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
