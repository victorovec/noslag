import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:noslag/features/products/controllers/product_provider.dart';
import 'package:noslag/features/products/presentation/widgets/product_action_dialog.dart';
import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/features/dashboard/presentation/screens/custom_app_drawer.dart';

class ProductScreen extends ConsumerStatefulWidget {
  const ProductScreen({super.key});

  @override
  ConsumerState<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductScreen> {
  final ScrollController _controller = ScrollController();


final _scaffoldKey = GlobalKey<ScaffoldState>();
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
       key: _scaffoldKey,
       drawer: const CustomAppDrawer(), 
      backgroundColor: const Color(0xffF2F1F3),
      appBar:  CustomAppBar(
        title: 'Products',
        color: Color(0xffF2F1F3),
        showShadow: false,
        showMenu: true,
        showSearch: true,
        onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: productAsync.when(
          data:
              (products) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // List of products
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      child: Container(
                        width: 140,
                        height: 44,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x2B000000), // subtle shadow
                              blurRadius: 12,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text(
                                'All Products',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Color(0xff242429),
                                ),
                              ),
                              SizedBox(width: 10),
                              Image.asset('assets/icons/arrow_down.png'),
                            ],
                          ),
                        ),
                      ),
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
                          return GestureDetector( 
                          onTap: () {
                            print('Product tapped: ${product.name}');
                            Get.toNamed(
                              RoutesConstant.productDetails,
                              arguments: product,
                            );
                          },
                          child:  Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                    
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
                                                'assets/images/matell.png',
                                                height: 70,
                                                width: 67,
                                              ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.name,
                                        style: TextStyle(
                                          color: Color(0xff242429),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        'PD-12${product.qtyPKT}',
                                        style: TextStyle(
                                          color: Color(0xff54C1F7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        product.packagingLabel,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        '${product.totalStock}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
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
                                      print('more vert tapped');
                                      ProductActionDialog.show(
                                        context,
                                        onEdit: () {
                                          // Handle edit logic here
                                        },
                                      );
                                      // ignore: unused_label
                                      onDelete:
                                      () {
                                        // Handle delete logic here
                                      };
                                    },
                                    child: Icon(Icons.more_vert),
                                  ),
                                ),
                              ],
                            ),
                          ));
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 60),
        child: Container(
          width: 67,
          height: 63,
          decoration: BoxDecoration(
            color: const Color(0xFF13A9F4),
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.12),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              print('fab tapped');
              Get.toNamed(RoutesConstant.addNewProduct);
            },
            icon: const Icon(Icons.add),
            iconSize: 18,
            color: Colors.white,
            padding: const EdgeInsets.all(0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
