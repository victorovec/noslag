import 'package:flutter/material.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/features/dashboard/data/locals/dashboard_local.dart'; // your dashboardList
import 'package:get/get.dart';
import 'package:noslag/core/utils/responsive.dart';
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dashboardList.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4, // 2 items per row
          mainAxisSpacing: 10, // vertical spacing
          crossAxisSpacing: 10, // horizontal spacing
          childAspectRatio: 0.9, // width to height ratio of each grid item
        ),
        itemBuilder: (context, index) {
          final item = dashboardList[index];

          return GestureDetector(
            onTap: () {
              print('product screen');
              Get.toNamed(RoutesConstant.products);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: item.borderColor, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: item.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.number.toString(),
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w700,
                      color: item.color,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: item.color1, // light background color, optional
                    ),
                    child: Image.asset(
                      item.imageUrl,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
