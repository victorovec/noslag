import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/features/auth/presentation/screens/signin.dart';
import 'package:noslag/features/dashboard/presentation/screens/dashboard.dart';
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
  ];
}