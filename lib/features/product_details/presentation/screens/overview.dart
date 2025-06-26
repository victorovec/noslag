// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import for the chart

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  // State for the chart's dropdown
  String _selectedMonth = 'This Month';

  // Helper widget to build individual key-value information rows
  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B6B6B), // A mid-grey for labels
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: valueColor ?? const Color(0xFF878594), // Dark grey/black for values
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget to build standard sections with a title and white background/shadow
  Widget _buildSectionCard({
    required String title,
    required Widget content,
    bool titleInside = false,
  }) {
    if (titleInside) {
      // Title inside the container
      return Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 0.7,
            color: const Color(0xffD7D6DB), // Added const
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF242429),
              ),
            ),
            const SizedBox(height: 12.0),
            content,
          ],
        ),
      );
    } else {
      // Title outside the container
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF242429),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                width: 0.7,
                color: const Color(0xffD7D6DB), // Added const
              ),
            ),
            child: content,
          ),
        ],
      );
    }
  }

  // Helper function to create the cells for a Stock Location TableRow (data rows)
  List<Widget> _buildStockLocationTableDataCells(String name, String stockOnHand, String committedStock, String availableForSale) {
    const TextStyle dataTextStyle = TextStyle(fontSize: 13, color: Color(0xFF878594), fontWeight: FontWeight.w400);

    return [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(name, style: dataTextStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(stockOnHand, textAlign: TextAlign.right, style: dataTextStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(committedStock, textAlign: TextAlign.right, style: dataTextStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(availableForSale, textAlign: TextAlign.right, style: dataTextStyle),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    const Color labelColor = Color(0xFF242429); // Head color (for RichText labels)
    const Color valueColor = Color(0xFF878594); // Other color (for RichText values and table text)

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF2F1F3),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0), // Overall screen padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Summary Section (Quantity, Unit, Packs, Pieces)
            Container(
              margin: const EdgeInsets.only(bottom: 30.0), // Added top margin for consistency
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400), // Base style
                      children: [
                        TextSpan(text: 'Quantity: ', style: TextStyle(color: labelColor)),
                        TextSpan(text: '7', style: TextStyle(color: valueColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: 'Unit: ', style: TextStyle(color: labelColor)),
                        TextSpan(text: 'Pack', style: TextStyle(color: valueColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: 'Packs: ', style: TextStyle(color: labelColor)),
                        TextSpan(text: '5', style: TextStyle(color: valueColor)),
                      ],
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(text: 'Pieces: ', style: TextStyle(color: labelColor)),
                        TextSpan(text: '24', style: TextStyle(color: valueColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xffD7D6DB),
              height: 1,
            ),
            const SizedBox(height: 20),
            // 2. Product Information Section (Manufacturer, Brand, Baseline)
            // This section's layout implies a custom arrangement, not standard _buildInfoRow
            // Replicating the row/column structure as provided by you.
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Manufacturer:',
                          style: TextStyle(
                            color: Color(0xff242429),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Tesla',
                          style: TextStyle(
                            color: Color(0xff878594),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Brand:',
                          style: TextStyle(
                            color: Color(0xff242429),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Pocketflow',
                          style: TextStyle(
                            color: Color(0xff878594),
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'Baseline :',
                      style: TextStyle(
                        color: Color(0xff242429),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Above 1',
                      style: TextStyle(
                        color: Color(0xff878594),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            const Divider(
              thickness: 1,
              color: Color(0xffD7D6DB),
              height: 1,
            ),
            const SizedBox(height: 20),
            // 3. Purchase Information Section
            _buildSectionCard(
              title: 'Purchase information',
              content: Column(
                children: [
                  _buildInfoRow('Per Packet', 'USD 12.00'),
                  _buildInfoRow('Per Piece', 'USD 12.00'),
                ],
              ),
            ),

            // 4. Sales Information Section
            _buildSectionCard(
              title: 'Sales information',
              content: Column(
                children: [
                  _buildInfoRow('Per Packet', 'USD 12.00'),
                  _buildInfoRow('Per Piece', 'USD 12.00'),
                ],
              ),
            ),

            // 5. Accounting Stock Section (titleInside: true)
            _buildSectionCard(
              title: 'Accounting Stock',
              titleInside: true,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // This seems to be a header row of sorts
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Stock on Hand',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Available for sales',
                          textAlign: TextAlign.right, // Align to right
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6B6B6B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildInfoRow('2.00', '2.00'), // Values underneath
                  const SizedBox(height: 12.0),
                  const Text(
                    'Quantity information',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF242429),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  _buildInfoRow('Quantity to be shipped', '2.00'),
                  _buildInfoRow('Quantity to be received', '2.00'),
                ],
              ),
            ),

            // 6. Stock Location Section (Table widget implementation)
            _buildSectionCard(
              title: 'Stock Location',
              content: Table(
                border: const TableBorder(
                  horizontalInside: BorderSide(color: Color(0xFFF0F0F0), width: 1.0), // Light horizontal borders
                  // No vertical or outer borders as per screenshot
                ),
                columnWidths: const {
                  0: FlexColumnWidth(3), // WAREHOUSE NAME
                  1: FlexColumnWidth(2), // STOCK ON HAND
                  2: FlexColumnWidth(2), // COMMITTED STOCK
                  3: FlexColumnWidth(2), // AVAILABLE FOR SALE
                },
                children: [
                  // Table Header Row
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'WAREHOUSE NAME',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xFF878594)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'STOCK ON HAND',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xFF878594)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'COMMITTED STOCK',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xFF878594)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'AVAILABLE FOR SALE',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xFF878594)),
                        ),
                      ),
                    ],
                  ),
                  // Table Data Rows
                  TableRow(children: _buildStockLocationTableDataCells('Primary Warehouse (London)', '2.00', '2.00', '2.00')),
                  TableRow(children: _buildStockLocationTableDataCells('Secondary Warehouse (London)', '2.00', '2.00', '2.00')),
                ],
              ),
            ),

            const SizedBox(height: 30), // Spacing before the chart section

            // --- Sales Order Summary Chart Section (Moved to the end) ---
            Container(
              // Outer container styling matching the card-like appearance
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(bottom: 16.0), // Add bottom margin for overall page spacing
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0), // Rounded corners for the card
                boxShadow: [
                  BoxShadow(
                    // ignore: //deprecated_member_use
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section: "SALES ORDER SUMMARY" and "This Month" dropdown
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SALES ORDER\nSUMMARY',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF242429), // Dark text color
                        ),
                      ),
                      // "This Month" dropdown with calendar icon
                      Column(
                        children: [
                          const Text(
                            'This Month', // Separate text for "This Month"
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF242429), // Adjust color if needed
                            ),
                          ),
                          //const SizedBox(height: 8),
                          Container(
                           // height: 25,
                            width: 72,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFD7D6DB)), // Light grey border
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedMonth,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFF878594)), // Dropdown icon color
                                items: <String>['This Month', 'Last Month', 'Last 3 Months', 'This Year']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        if (value == 'This Month') // Show calendar icon only for 'This Month'
                                          const Icon(Icons.calendar_today_outlined, size: 16, color: Color(0xFF878594)),
                                       // if (value == 'This Month') const SizedBox(width: 8),
                                       /* Text(
                                          value,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF242429),
                                          ),
                                        ),*/
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedMonth = newValue!;
                                  });
                                },
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF242429),
                                ),
                                dropdownColor: Colors.white,
                                isDense: true, // Makes the button more compact
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Spacing between header and chart

                  // Line Chart Section
                  SizedBox(
                    height: 200, // Fixed height for the chart area
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false, // No vertical grid lines
                          drawHorizontalLine: true, // Horizontal grid lines
                          getDrawingHorizontalLine: (value) {
                            if (value == 0) {
                              return const FlLine(color: Color(0xFFD7D6DB), strokeWidth: 1); // Darker line at 0
                            }
                            return const FlLine(color: Color(0xFFF0F0F0), strokeWidth: 0.5); // Lighter lines
                          },
                          getDrawingVerticalLine: (value) => const FlLine(
                            color: Color(0xFFF0F0F0), // Lighter vertical lines
                            strokeWidth: 0.5,
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              interval: 1, // Set interval to 1 to have more control
                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(
                                  color: Color(0xFF878594), // Axis label color
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                );
                                // Directly return the SideTitleWidget with the formatted value
                                switch (value.toInt()) {
                                  case 1:
                                  case 5:
                                  case 10:
                                  case 15:
                                  case 20:
                                  case 25:
                                  case 30:
                                    return SideTitleWidget(
                                      meta: meta, // REQUIRED: Pass the TitleMeta object
                                      space: 4.0,
                                      child: Text(value.toInt().toString(), style: style),
                                    );
                                  default:
                                    return const SizedBox.shrink(); // Hide other labels
                                }
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              interval: 10000, // Interval for y-axis labels (10k, 20k etc.)
                              getTitlesWidget: (value, meta) {
                                const style = TextStyle(
                                  color: Color(0xFF878594), // Axis label color
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                );
                                String textValue;
                                if (value == 10000) { textValue = '10k'; }
                                else if (value == 20000) { textValue = '20k'; }
                                else if (value == 30000) { textValue = '30k'; }
                                else if (value == 40000) { textValue = '40k'; }
                                else if (value == 50000) { textValue = '50k'; }
                                else if (value == 60000) { textValue = '60k'; }
                                else { return const SizedBox.shrink(); } // Hide other labels
                                return SideTitleWidget( // Use SideTitleWidget for consistency
                                  meta: meta, // REQUIRED: Pass the TitleMeta object
                                  space: 0, // No extra space needed if Text is already aligned
                                  child: Text(textValue, style: style, textAlign: TextAlign.left),
                                );
                              },
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false, // No border around the chart itself
                        ),
                        minX: 0,
                        maxX: 31, // Max X value (for 31 days in a month)
                        minY: 0,
                        maxY: 60000, // Max Y value for the chart
                        lineBarsData: [
                          // Main blue line - Adjust spots to cover the 31 days
                          LineChartBarData(
                            spots: const [
                              FlSpot(1, 12000),
                              FlSpot(5, 26000),
                              FlSpot(10, 31000),
                              FlSpot(15, 34000),
                              FlSpot(20, 36000),
                              FlSpot(25, 20000),
                              FlSpot(30, 22000), // Added a point near end of month
                            ],
                            isCurved: true,
                            gradient: LinearGradient( // Blue gradient
                              colors: [
                                const Color(0xFF54C1F7).withOpacity(0.8), // Lighter blue
                                const Color(0xFF13A9F4).withOpacity(0.8), // Darker blue
                              ],
                            ),
                            barWidth: 3,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false), // Hide dots on the line
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient( // Area below the line
                                colors: [
                                  const Color(0xFF13A9F4).withOpacity(0.2), // Lighter blue
                                  const Color(0xFF54C1F7).withOpacity(0.0), // Transparent
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          // Dashed grey line (representing the baseline or comparison) - Adjust spots
                          LineChartBarData(
                            spots: const [
                              FlSpot(1, 25000),
                              FlSpot(5, 28000),
                              FlSpot(10, 29000),
                              FlSpot(15, 28000),
                              FlSpot(20, 23000),
                              FlSpot(25, 15000),
                              FlSpot(30, 18000), // Added a point near end of month
                            ],
                            isCurved: true,
                            color: const Color(0xFFD7D6DB), // Grey color for dashed line
                            barWidth: 1.5,
                            dotData: const FlDotData(show: false),
                            dashArray: [5, 5], // Dashed pattern
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // Spacing before the month label
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}