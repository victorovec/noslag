import 'package:flutter/material.dart';
import 'package:noslag/features/product_details/presentation/widgets/drop_down_shell.dart';

  Widget buildInvoiceDropdown() {
    return DropdownShell(
      leadingIcon: Icons.tune,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: 'Invoice',
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          onChanged: (_) {}, // Static
          items: const [
            DropdownMenuItem(
              value: 'Invoice',
              child: Text('Invoice',
               style: TextStyle(
                          color: Color(0xFF242429),
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
              ),
            ),
            DropdownMenuItem(
              value: 'Receipt',
              child: Text('Receipt'),
            ),
          ],
        ),
      ),
    );
  }