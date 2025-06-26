import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:noslag/routes.dart';
import 'package:noslag/core/constants/routes.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NO SLAG',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesConstant.splash,
      getPages: AppRoutes.routes,
      
    );
  }
}
