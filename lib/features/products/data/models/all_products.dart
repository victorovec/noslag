class Product {
  final String name;
  final String productCode;
  final String description;
  final double price;
  final int totalStock;
  final String category;
  final bool isLowStock;
  final String imageUrl;
  final String dimensions;

  // New fields
  final String unit;
  final String volume;
  final String qtyPKT;

  Product({
    required this.name,
    required this.productCode,
    required this.description,
    required this.price,
    required this.totalStock,
    required this.category,
    required this.isLowStock,
    required this.imageUrl,
    required this.dimensions,
    required this.unit,
    required this.volume,
    required this.qtyPKT,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Safely get totalStock
    final totalStock = json['totalStock'] is int ? json['totalStock'] : 0;

    // Safely get price from stocks[0]['purchase']['costPrice']
    double price = 0.0;
    try {
      final stocks = json['stocks'];
      if (stocks is List && stocks.isNotEmpty) {
        final purchase = stocks[0]['purchase'];
        if (purchase != null && purchase['costPrice'] != null) {
          price = double.tryParse(purchase['costPrice'].toString()) ?? 0.0;
        }
      }
    } catch (_) {
      price = 0.0;
    }

    // Safely get category from categories[0]['name']
    String category = 'Unknown';
    try {
      final categories = json['categories'];
      if (categories is List && categories.isNotEmpty) {
        final name = categories[0]['name'];
        if (name is String) {
          category = name;
        }
      }
    } catch (_) {
      category = 'Unknown';
    }

    // Safely get imageUrl from image[0]['url']
    String imageUrl = '';
    try {
      final imageList = json['image'];
      if (imageList is List && imageList.isNotEmpty) {
        final firstImage = imageList[0];
        if (firstImage != null && firstImage['url'] != null) {
          imageUrl = firstImage['url'];
        }
      }
    } catch (_) {
      imageUrl = '';
    }

    return Product(
      name: json['name'] ?? '',
      productCode: json['productCode'] ?? '',
      description: json['description'] ?? '',
      price: price,
      totalStock: totalStock,
      category: category,
      isLowStock: totalStock < 14,
      imageUrl: imageUrl,
      dimensions: json['dimensions'] ?? '',
      unit: json['unit'] ?? '',
      volume: json['volume'] ?? '',
      qtyPKT: json['qtyPKT'] ?? '',
    );
  }

  /// Derived field for packaging label
  String get packagingLabel {
    final qty = qtyPKT.isNotEmpty ? qtyPKT : '1';
    final vol = volume.isNotEmpty ? volume : 'unit';
    return '$unit x $qty $vol';
  }
}
