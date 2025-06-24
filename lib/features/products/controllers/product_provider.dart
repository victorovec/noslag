import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/features/products/data/repository/product_service.dart';
import 'package:noslag/features/products/data/models/all_products.dart';

final productServiceProvider = Provider((ref) => ProductService());

final productListProvider = FutureProvider<List<Product>>((ref) async {
  final service = ref.read(productServiceProvider);
  return service.getAllProducts();
});

