import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;                    
  final Widget? titleWidget;             
  final Color color;
  final bool showShadow;
  final bool showMenu;
  final bool showSearch;
  final bool showBack;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleWidget,
    this.color = Colors.white,
    this.showShadow = true,
    this.showMenu = false,
    this.showSearch = false,
    this.showBack = false,  
    this.onBackTap,
    this.onMenuTap,
    this.onSearchTap,
    this.onNotificationTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: showShadow
            ? [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
          child: AppBar(
            backgroundColor: color,
            
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight,
        titleSpacing: 0,
        //title: title,
        actions: const [],
        flexibleSpace: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        (showMenu)
                ? GestureDetector(
                    onTap: onMenuTap,
                    child: Image.asset(
                      'assets/icons/menu.png',
                      width: 24,
                      height: 24,
                    ),
                  )
                : showBack
                    ? GestureDetector(
                        onTap: onBackTap ?? () => Get.back(),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff242429),
                        ),
                      )
                    : const SizedBox.shrink(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: titleWidget ??
                        Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xff1D2A5D),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                ),
                if (showSearch)
                  GestureDetector(
                    onTap: onSearchTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image.asset('assets/icons/search_icon.png'),
                    ),
                  ),
                GestureDetector(
                  onTap: onNotificationTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset('assets/icons/not-icon.png'),
                  ),
                ),
                GestureDetector(
                  onTap: onProfileTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset('assets/icons/profile.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
