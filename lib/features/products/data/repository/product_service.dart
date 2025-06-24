import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:noslag/features/products/data/models/all_products.dart';
import 'package:noslag/core/constants/api_constants.dart';

class ProductService {
  final _storage = FlutterSecureStorage();

  Future<List<Product>> getAllProducts({
  int page = 1,
  int limit = 10,
}) async {
  final token = await _storage.read(key: 'auth_token');
  if (token == null) throw Exception('No token found');

  final url = Uri.parse('$baseUrl/products/get-all?page=$page&limit=$limit');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    // ⛳ Extract the list inside `data`
    final productList = (data['data'] as List)
        .map((item) => Product.fromJson(item))
        .toList();

    if (productList.isNotEmpty) {
      print('🟢 First Product: ${productList[0].name}');
    } else {
      print('⚠️ No products found');
    }

    return productList;
  } else {
    print('🔴 Error Response: ${response.body}');
    throw Exception('Failed to load products: ${response.statusCode}');
  }
}

  }

