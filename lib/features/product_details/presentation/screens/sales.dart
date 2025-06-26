import 'package:flutter/material.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F1F3), // same page-grey you’re using
      //padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ───────────── Search & period filter ─────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _SearchField(),
                
                _PeriodDropdown(),
              ],
            ),
            const SizedBox(height: 12),
        
            // Thin progress-bar-like line under the filters
            Container(
              height: 2,
              color: const Color(0xFFD7D6DB),
            ),
            const SizedBox(height: 12),
        
            // ───────────── Horizontally-scrollable table ─────────────
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: DataTable(
                  headingRowHeight: 44,
                  // ignore: deprecated_member_use
                  dataRowHeight: 52,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF878594),
                  ),
                  dataTextStyle: const TextStyle(fontSize: 13),
                  columnSpacing: 28,
                  horizontalMargin: 16,
                  dividerThickness: 0.6,
                  columns: const [
                    DataColumn(label: Text('BATCH NO')),
                    DataColumn(label: Text('DATE\nRECEIVED')),
                    DataColumn(label: Text('SUPPLIER')),
                    DataColumn(label: Text('WAREHOUSE')),
                    DataColumn(label: Text('INITIAL\nQUANTITY')),
                    DataColumn(label: Text('COST\nPRICE')),
                    DataColumn(label: Text('INITIAL\nVALUE')),
                    DataColumn(label: Text('QUANTITY\nSOLD')),
                    DataColumn(label: Text('SALES\nVALUE')),
                    DataColumn(label: Text('GROSS\nMARGIN')),
                  ],
                  rows: _demoRows,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ───────────── Demo rows (replace with real data) ─────────────
  static final List<DataRow> _demoRows = List.generate(
    2,
    (_) => const DataRow(
      cells: [
        DataCell(Text('PRI2024082')),
        DataCell(Text('14 Jan 2024')),
        DataCell(Text('Tony Stark')),
        DataCell(Text('Lagos')),
        DataCell(Text('2')),
        DataCell(Text('\$ 3.00')),
        DataCell(Text('5.00')),
        DataCell(Text('2')),
        DataCell(Text('5.00')),
        DataCell(
          Text(
            '+\$ 2.00',
            style: TextStyle(
              color: Color(0xFF2EAD55), // green profit colour
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}

// ───────────────────────────── Helper widgets ─────────────────────────────

// Search box on the left
class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 152,
      height: 36,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Find batch',
          hintStyle: const TextStyle(
          color: Color(0xFFBCBBC3), // grey tone like the design
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
          suffixIcon: const Icon(Icons.search, size: 14,color: Color(0xffBCBBC3),),
          contentPadding: const EdgeInsets.only(left: 10),
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Color(0xFFBCBBC3),width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Color(0xFFBCBBC3)),
          ),
        ),
      ),
    );
  }
}

// Dropdown that shows “This Month ▼” with a calendar icon
class _PeriodDropdown extends StatefulWidget {
  const _PeriodDropdown();

  @override
  State<_PeriodDropdown> createState() => _PeriodDropdownState();
}

class _PeriodDropdownState extends State<_PeriodDropdown> {
  String _period = 'This Month';
  final _items = const ['Today', 'This Week', 'This Month', 'This Year'];

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          //isExpanded: true,
          value: _period,
          onChanged: (val) => setState(() => _period = val!),
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          
          selectedItemBuilder: (context) => _items
              .map((v) => Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      
                      Text(
                        v,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.calendar_today, size: 14),
                    ],
                  ))
              .toList(),
          items: _items
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
