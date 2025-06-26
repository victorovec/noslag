import 'package:flutter/material.dart';
import 'package:noslag/features/product_details/data/models/product_details_model.dart';

List<ProductDetailsModel> productDetailsList = [
  ProductDetailsModel(
    icon: Icons.keyboard_arrow_down_outlined,             
    name: 'Overview',
    imageIcon: 'assets/images/eye.png',
  ),
  ProductDetailsModel(
    icon: Icons.keyboard_arrow_down_outlined,
    name: 'Transactions',
    imageIcon: 'assets/images/credit-card.png',
  ),
  ProductDetailsModel(
    icon: Icons.keyboard_arrow_down_outlined,
    name: 'Adjustments',
    imageIcon: 'assets/images/adjustments.png',
  ),
  ProductDetailsModel(
    icon: Icons.keyboard_arrow_down_outlined,
    name: 'SALES',
    imageIcon: 'assets/images/icon-park-outline_sales-report.png',
  ),
];
