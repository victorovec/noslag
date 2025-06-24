import 'package:flutter/material.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:noslag/features/dashboard/presentation/widgets/dashboard_grid.dart';
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: CustomAppBar(title: 'Hi, David Stark',color: Color(0xffffffff),),
      body: DashboardGrid(),
    );
  }
}