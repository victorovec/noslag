import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/core/utils/responsive.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:noslag/features/product_details/data/locals/product_details_list.dart.dart';
import 'package:noslag/features/product_details/presentation/screens/adjustments.dart';
import 'package:noslag/features/product_details/presentation/screens/overview.dart';
import 'package:noslag/features/product_details/presentation/screens/sales.dart';
import 'package:noslag/features/product_details/presentation/screens/transactions.dart';
import 'package:noslag/features/products/data/models/all_products.dart';
import 'package:get/get.dart';
import 'package:noslag/features/product_details/controller/expanded_indices.dart';
class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({super.key});

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  
  
  @override
  Widget build(BuildContext context) {
    final expandedIndices = ref.watch(expandedIndicesProvider);
     final Product product = Get.arguments;
    return Scaffold(
      //backgroundColor: Color(0xffF2F1F3),
      backgroundColor: Color(0xffffffff),
      appBar: CustomAppBar(title: 'Product',showBack: true,),
      body: Column(
        children: [
        
          Image.network(
            product.imageUrl,
            height: Responsive.isMobile(context) ? 357 :200,
            width: double.infinity,
            fit:
                BoxFit
                    .cover, // Ensures image scales nicely inside the box
            errorBuilder:
                (context, error, stackTrace) =>
                    Image.asset(
                      'assets/images/matell.png',
                      height: Responsive.isMobile(context) ? 357 :200,
                      width: double.infinity,
                    ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(46,14,34,16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  //Text(product.name)
                  Text(
                  product.name,
                  style: TextStyle(
                    color: Color(0xff242429),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'PD-12${product.qtyPKT}',
                  style: TextStyle(
                    color: Color(0xff878594),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ],
              ),
              Container(
                  width: 133,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xff13A9F4),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow:[ BoxShadow(
                      offset: Offset(0, 4),
                      spreadRadius: 2,
                      blurRadius: 12,
                      color: Color(0x1A000000),
                    ),],
                    border: Border.all(
                      width: 1,
                      color: Color(0xff13A9F4)
                    )
                  ),
                  child: Center(child: Text('Adjust Stock',
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w600,
                    fontSize: 13
                  ),
                  ))
                ),
            ],),
          ),
           Divider(
            thickness: 1, 
            color: Color(0xffD7D6DB), 
            height: 1, 
          ),
          Expanded(
            child: ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            itemCount: productDetailsList.length,
            itemBuilder: (context, index) {
              final item = productDetailsList[index];
              final isExpanded = expandedIndices.contains(index);
              return Column(
                children: [
                  ListTile(
                    leading: Image.asset(item.imageIcon),
                    title: Text(item.name),
                    trailing: GestureDetector(
                      onTap: () {
                        ref.read(expandedIndicesProvider.notifier).toggle(index);
                      },
                      child: Icon(
                        isExpanded
                      ? Icons.keyboard_arrow_up_outlined
                      : Icons.keyboard_arrow_down_outlined,
                        )),
                  ),
                  if (isExpanded)
                  _buildExpandedContentForIndex(index),
                  Divider(
                  thickness: 1, 
                  color: Color(0xffD7D6DB), 
                  height: 1, 
                ),
                ],
              );
            },
                    ),
          ),
         
        ],
      ),
    );
  }
}


Widget _buildExpandedContentForIndex(int index) {
    switch (index) {
      case 0:
        return Overview();
      case 1:
        return Transactions();
      case 2:
        return Adjustments();
      case 3:
        return Sales();
      default:
        return Text("No details available.");
    }
  }
