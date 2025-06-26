import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:noslag/core/colors.dart';
import 'package:noslag/core/constants/routes.dart';
import 'package:noslag/features/auth/controllers/signin.dart';
import 'package:noslag/core/widgets/custom_input_field.dart';
import 'package:noslag/core/widgets/primay_button.dart';
import 'package:get/get.dart';
import 'package:noslag/core/utils/responsive.dart';

class Signin extends ConsumerStatefulWidget {
  const Signin({super.key});

  @override
  ConsumerState<Signin> createState() => _SigninState();
}

class _SigninState extends ConsumerState<Signin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );

      return;
    }

    await ref.read(loginProvider.notifier).login(email, password);
    
    //Get.offAllNamed(RoutesConstant.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = ref.watch(obscureTextProvider);
    final loginState = ref.watch(loginProvider);
    ref.listen<AsyncValue<bool>>(loginProvider, (previous, next) {
      if (next is AsyncData && next.value == true) {
        Get.offAllNamed(RoutesConstant.dashboard);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signin.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login UI
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  Responsive.isMobile(context) ? SizedBox(height: 93):SizedBox(height: 0),
                  
                  const Text(
                    'Login as Vendor',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 22),

                  // Email Field
                  CustomInputField(
                    borderRadius: 5,
                    height: 52,
                    controller: emailController,
                    hintText: 'Email Address',
                    fillColor: Color(0xffF2F1F3),
                    prefixIcon: Image.asset('assets/icons/email_icon.png'),
                  ),
                  //const SizedBox(height: 17),

                  // Password Field
                  CustomInputField(
                    borderRadius: 5,
                    height: 52,
                    fillColor: Color(0xffF2F1F3),
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: obscureText,
                    prefixIcon: Image.asset('assets/icons/padlock_icon.png'),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        ref.read(obscureTextProvider.notifier).state =
                            !ref.read(obscureTextProvider);
                      },
                      child: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xff878594),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.skyBlue,
                    ),
                  ),

                  Responsive.isMobile(context) ? SizedBox(height: 230):SizedBox(height: 10),

                  // Show error or loader
                  if (loginState.hasError)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        loginState.error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PrimaryButton(
                      label: loginState.isLoading ? 'Loging in...' : 'Login',
                      onPressed: () {
                        loginState.isLoading ? null : handleLogin();
                      },
                      backgroundColor:
                          loginState.isLoading
                              ? Color(0xCCFF8A00)
                              : AppColors.darkOrange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
