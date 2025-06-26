import 'package:flutter/material.dart';
import 'package:noslag/features/product_details/presentation/widgets/drop_down_shell.dart';

 
  class BuildStatusDropdown extends StatefulWidget {
  const BuildStatusDropdown({super.key});

  @override
  State<BuildStatusDropdown> createState() => _BuildStatusDropdownState();
}

class _BuildStatusDropdownState extends State<BuildStatusDropdown> {
  @override
  Widget build(BuildContext context) {
    String status = 'All'; // current selection
    final items = ['All', 'Paid', 'Pending'];
    return DropdownShell(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: status,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          selectedItemBuilder: (context) => items
              .map((v) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          color: Color(0xFF242429),
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      
                      Text(v,
                       style: TextStyle(
                          color: Color(0xFF242429),
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ))
              .toList(),
          onChanged: (val) => setState(() => status = val!),
          items: items
              .map(
                (v) => DropdownMenuItem(
                  value: v,
                  child: Text(v),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}