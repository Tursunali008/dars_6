import 'dart:convert';
import 'package:dars6/models/product.dart';
import 'package:http/http.dart' as http;

class ProductControllers {
  final List<Product> _list = [];

  List<Product> get products => List.unmodifiable(_list);

  Future<void> getUser() async {
    try {
      final response = await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

      if (response.statusCode == 200) {
        List jsonResponse = jsonDecode(response.body);
        _list.clear();
        for (var item in jsonResponse) {
          _list.add(Product.fromJson(item));
        }
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }
  }
}
