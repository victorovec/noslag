import 'package:flutter/material.dart';

/// Safe to call inside `_buildExpandedContentForIndex`.
class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  String _status = 'All'; // current selection

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F1F3),
      //padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // ───────────── Filter row ─────────────
          Row(
            children: [
              Expanded(child: _buildInvoiceDropdown()),
              const SizedBox(width: 12),
              Expanded(child: _buildStatusDropdown()),
            ],
          ),
          const SizedBox(height: 20),

          // ───────────── Transactions list ─────────────
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2, // Demo count
            separatorBuilder: (_, __) => const Divider(
              thickness: 1,
              color: Color(0xFFD7D6DB),
              height: 32,
            ),
            itemBuilder: (_, __) => _buildTransactionRow(),
          ),
        ],
      ),
    );
  }

  // ---------- Invoice dropdown ----------
  Widget _buildInvoiceDropdown() {
    return _DropdownShell(
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
              child: Text('Invoice'),
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

  // ---------- Status dropdown ----------
  Widget _buildStatusDropdown() {
    final items = ['All', 'Paid', 'Pending'];
    return _DropdownShell(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _status,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          selectedItemBuilder: (context) => items
              .map((v) => Row(
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(
                          color: Color(0xFF878594),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(v),
                    ],
                  ))
              .toList(),
          onChanged: (val) => setState(() => _status = val!),
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

  // ---------- Transaction row (not card) ----------
  Widget _buildTransactionRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First row: Invoice # and Customer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'INV-000234',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text(
              'Clark Kent',
              style: TextStyle(fontWeight: FontWeight.w600),
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
              style: TextStyle(color: Color(0xFF878594)),
            ),
            Row(
              children: [
                Text('Qty: 120', style: TextStyle(color: Color(0xFF878594))),
                SizedBox(width: 12),
                Text('Price: \$3.00',
                    style: TextStyle(color: Color(0xFF878594))),
                SizedBox(width: 12),
                Text('Total: \$3.00',
                    style: TextStyle(color: Color(0xFF878594))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// Reusable shell for dropdown styling
class _DropdownShell extends StatelessWidget {
  const _DropdownShell({
    required this.child,
    this.leadingIcon,
  });

  final Widget child;
  final IconData? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
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
