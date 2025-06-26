import 'package:flutter/material.dart';

class DropdownShell extends StatelessWidget {
  const DropdownShell({super.key, 
    required this.child,
    this.leadingIcon,
  });

  final Widget child;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xffD7D6DB)),

      ),
      child: Row(
        
        children: [
          if (leadingIcon != null) ...[
            Icon(leadingIcon, size: 16, color: Colors.grey),
            const SizedBox(width: 6),
          ],
          Expanded(child: child),
        ],
      ),
    );
  }
}