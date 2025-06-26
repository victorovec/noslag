import 'package:flutter/material.dart';
//import 'package:noslag/core/colors.dart';

class CustomInputField extends StatelessWidget {
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final Color? fillColor;
  final Color? labelColor;
  final double height;
  final Widget? labelWidget;
  final double borderRadius;

  const CustomInputField({
    super.key,
    this.labelWidget,
    this.label,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.fillColor,
    this.labelColor,
    required this.height,
    this.borderRadius = 7,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelWidget != null ? labelWidget!
         :( label!= null ?
          Text(label!,
          style: TextStyle(
            color: labelColor,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
          ) : SizedBox.shrink()),
          SizedBox(
            height: height,
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              validator: validator,
              onChanged: onChanged,
              enabled: enabled,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Color(0xff878594), fontSize: 13),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: fillColor,
      
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: Color(0xffF2F1F3), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(color: Color(0xffF2F1F3), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(
                    color: Color(0xff13A9F4),
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
