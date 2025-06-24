import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color textColor;
  

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor, 
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        minimumSize: const Size(double.infinity, 52),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 13,fontWeight: FontWeight.w600)),
    );
  }
}