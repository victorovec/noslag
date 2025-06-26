import 'package:flutter/material.dart';

class ProductActionDialog {
  static void show(BuildContext context, {VoidCallback? onEdit, VoidCallback? onDelete}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main Box
              Container(
                width: 256,
                height: 174,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onEdit?.call();
                      },
                      child: const Text(
                        'Edit Product',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF242429),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onDelete?.call();
                      },
                      child: const Text(
                        'Delete Product',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xffF61732),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Cancel Button
              Container(
                width: 256,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF242429),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
