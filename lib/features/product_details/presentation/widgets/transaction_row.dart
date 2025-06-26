import 'package:flutter/material.dart';
  Widget buildTransactionRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First row: Invoice # and Customer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'INV-000234',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xff242429)),
            ),
            Text(
              'Clark Kent',
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Color(0xff242429)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Second row: Date and Quantity/Price/Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              '14 Jan 2023',
              style: TextStyle(color: Color(0xFF242429),fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Text('Qty: 120', style: TextStyle(color: Color(0xFF878594),fontWeight: FontWeight.w400)),
                SizedBox(width: 12),
                Text('Price: \$3.00',
                    style: TextStyle(color: Color(0xFF878594),fontWeight: FontWeight.w400),),
                SizedBox(width: 12),
                Text('Total: \$3.00',
                    style: TextStyle(color: Color(0xFF878594),fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ],
    );
  }


