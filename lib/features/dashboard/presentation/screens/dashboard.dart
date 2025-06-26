import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:noslag/features/dashboard/presentation/screens/custom_app_drawer.dart';
import 'package:noslag/features/dashboard/presentation/widgets/dashboard_grid.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      drawer: const CustomAppDrawer(),

      // ✅ PreferredSize implements PreferredSizeWidget
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Builder(
          builder: (ctx) => CustomAppBar(
            title: 'Hi, David Stark',
            color: const Color(0xffffffff),
            showMenu: true,
            showSearch: true,
            onMenuTap: () {
              Scaffold.of(ctx).openDrawer();      
            },
          ),
        ),
      ),

      body: const DashboardGrid(),
    );
  }
}
