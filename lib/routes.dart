import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/features/auth/presentation/screens/signin.dart';
import 'package:noslag/features/dashboard/presentation/screens/custom_app_drawer.dart';
import 'package:noslag/features/dashboard/presentation/screens/dashboard.dart';
import 'package:noslag/features/new_product/presentation/screens/add_new_product.dart';
import 'package:noslag/features/product_details/presentation/screens/product_details.dart';
import 'package:noslag/features/products/presentation/screens/product_screen.dart';
import 'package:noslag/features/splash/splash_screen.dart';
import 'package:noslag/features/onboarding/onboarding.dart';
class AppRoutes {
  static List<GetPage<dynamic>> routes = [
    //splash
    GetPage(name: RoutesConstant.splash, page: () => SplashScreen()),
    GetPage(name: RoutesConstant.onboarding, page: () => Onboarding()),
    GetPage(name: RoutesConstant.signin, page: () => Signin()),

     //dashboard
    GetPage(name: RoutesConstant.dashboard, page: () => Dashboard()),
    //products
    GetPage(name: RoutesConstant.products, page: () => ProductScreen()),
    //add new product
    GetPage(name: RoutesConstant.addNewProduct, page: () => AddNewProduct()),
    GetPage(name: RoutesConstant.productDetails, page: () => ProductDetails()),

    GetPage(name: RoutesConstant.customDrawer, page: () => CustomAppDrawer()),

  ];
}