import 'package:flutter/material.dart';
import 'package:noslag/core/colors.dart';
import 'package:noslag/core/widgets/primay_button.dart';
import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
          width: double.infinity,
          height: double.infinity,
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/onboarding.png'),
              fit: BoxFit.cover, 
            ),
          ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 67),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(label: 'Get Started', onPressed: (){}, backgroundColor: AppColors.skyBlue),
                  SizedBox(height: 47,),
                  Text('Already have a NOSLAG account?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffffffff)
                  ),),
                  SizedBox(height: 13,),
                  PrimaryButton(label: 'Sign in', onPressed: (){
                    Get.toNamed(RoutesConstant.signin);
                  }, backgroundColor: AppColors.darkOrange)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}