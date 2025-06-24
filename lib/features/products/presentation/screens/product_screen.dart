import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:noslag/features/products/controllers/product_provider.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // If you plan to use pagination later, keep this:
    _controller.addListener(() {
      // Placeholder: Pagination logic would go here
    });
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productListProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF2F1F3),
      appBar: const CustomAppBar(
        title: 'Products',
        color: Color(0xffF2F1F3),
        showShadow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: productAsync.when(
          data:
              (products) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menu icon
                  /*Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/icons/menu.png', width: 24),
              ),*/
                  // List of products
                  Container(
                  width: 140,
                  height:44,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                      color: Color(0xffffffff), // subtle shadow
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 4),
                      )
                    ]
                  ),
                  child: Row(
                    children: [
                      Text('All Products'),
                      
                    ],
                  ),
                ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ListView.builder(
                        controller: _controller,

                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Image.network(
                                      product.imageUrl,
                                      height: 70,
                                      width: 70,
                                      fit:
                                          BoxFit
                                              .cover, // Ensures image scales nicely inside the box
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                                'assets/images/imageIcon.png',
                                                height: 70,
                                                width: 67,
                                              ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(product.name,
                                      style: TextStyle(
                                        color: Color(0xff242429),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                      ),
                                      Text('PD-12${product.qtyPKT}',
                                      style: TextStyle(
                                        color: Color(0xff54C1F7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                      ),
                                      Text(product.packagingLabel,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                        
                                      ),
                                      Text('${product.totalStock}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis
                                      ),
                                      ),
                                      Text(
                                        product.isLowStock
                                            ? 'Below 14'
                                            : 'Above 14',
                                        style: TextStyle(
                                          color:
                                              product.isLowStock
                                                  ? Color(0xffF61732)
                                                  : Color(0xff11EA64),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      // show popup or bottom sheet
                                    },
                                    child: Icon(Icons.more_vert),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
