import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api model.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper api = ApiHelper._();

  Future<List<Product>> fetchProducts() async {
    String api = "https://fakestoreapi.com/products";
    final response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
