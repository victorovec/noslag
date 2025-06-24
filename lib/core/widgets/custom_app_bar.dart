import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final bool showShadow;

  const CustomAppBar({super.key, required this.title, required this.color,this.showShadow = true,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        
        boxShadow: showShadow ? [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1), // subtle shadow
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ]: null
      ),
      child: AppBar(
        backgroundColor: color,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: kToolbarHeight,
        titleSpacing: 0,
        title: const SizedBox.shrink(), // hide default title
        actions: const [],
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xff1D2A5D),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset('assets/icons/search_icon.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset('assets/icons/not-icon.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
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
