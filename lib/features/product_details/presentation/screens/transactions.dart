import 'package:flutter/material.dart';
import 'package:noslag/features/product_details/presentation/widgets/invoice_drop_down.dart';
import 'package:noslag/features/product_details/presentation/widgets/transaction_row.dart'
    show buildTransactionRow;

import '../widgets/status_drop_down.dart';

/// Safe to call inside `_buildExpandedContentForIndex`.
class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F1F3), // Background color of the whole screen
      child: Padding(
        padding: const EdgeInsets.all(
          20.0,
        ), // Padding around the entire content
        child: Column(
          children: [
            // ───────────── Filter row ─────────────
            Row(
              children: [
                Expanded(child: buildInvoiceDropdown()),
                const SizedBox(width: 12),
                Expanded(child: BuildStatusDropdown()),
              ],
            ),
            const SizedBox(height: 20),

            // ───────────── Single Card Containing All Transactions ─────────────
            Container(
              padding: const EdgeInsets.all(
                16,
              ), // Internal padding for the card content
              decoration: BoxDecoration(
                color: Colors.white, // White background for the card
                borderRadius: BorderRadius.circular(
                  10,
                ), // Rounded corners for the card
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.05), // Subtle shadow
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.separated(
                // ListView.separated now *inside* the single card
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    2, // Demo count (assuming 2 transactions inside this card)
                separatorBuilder:
                    (_, __) => const Divider(
                      // The divider is now inside the card
                      thickness: 1,
                      color: Color(0xFFD7D6DB),
                      height: 32, // Height for the divider to create space
                    ),
                itemBuilder: (_, __) => buildTransactionRow(),
              ),
            ),
            SizedBox(height: 95),
          ],
        ),
      ),
    );
  }
}
