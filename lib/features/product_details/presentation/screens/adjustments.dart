import 'package:flutter/material.dart';

class Adjustments extends StatefulWidget {
  const Adjustments({super.key});

  @override
  State<Adjustments> createState() => _AdjustmentsState();
}

class _AdjustmentsState extends State<Adjustments> {
  String _selectedStatus = 'All'; // State for the Status dropdown

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF2F1F3), // Background color matching other screens
      //padding: const EdgeInsets.all(16.0), // Overall screen padding for Adjustments content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Filter and Search Hint Section
          Row(
            children: [
              // Status Filter Dropdown (Corrected to show "Status All")
              Container(
                width: 120, // Fixed width for the dropdown as per screenshot implies
              
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: const Color(0xFFD7D6DB)), // Light grey border
                  
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF878594)),
                    // CORRECTED: Use selectedItemBuilder to show "Status" + selected value
                    selectedItemBuilder: (BuildContext context) {
                      return <String>['All', 'Approved', 'Pending', 'Rejected']
                          .map((String value) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min, // To keep the row compact
                            children: [
                              const Text(
                                'Status ', // Added space for visual separation
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF242429), // Dark text for "Status"
                                  fontWeight: FontWeight.w500, // Slightly bolder
                                ),
                              ),
                              SizedBox(width: 5,),
                              Text(
                                value, // The actual selected value (e.g., "All")
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF878594), // Lighter text for the value
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList();
                    },
                    items: <String>['All', 'Approved', 'Pending', 'Rejected']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value, // This is just the selectable text in the popup list
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF242429),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue!;
                      });
                    },
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF242429),
                    ),
                    dropdownColor: Colors.white,
                    isDense: true, // Keep it compact vertically
                    isExpanded: true, // Allows the dropdown to take the full width of its container
                  ),
                ),
              ),
              const SizedBox(width: 10), // Space between dropdown and search hint
              // Search by Date, Warehouse, Reason and Description
              Expanded( // Expanded to take remaining horizontal space
                child: Row(
                  children: [
                    const Icon(Icons.info_outline, size: 16, color: Color(0xFF6B6B6B)), // Info icon
                    const SizedBox(width: 4),
                    const Expanded( // Expanded to allow text to wrap within the row
                      child: Text(
                        'Search by Date, Warehouse, Reason and Description',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF6B6B6B), // Light grey for hint text
                          overflow: TextOverflow.ellipsis, // Prevents overflow if it's very long
                        ),
                        maxLines: 2, // Allow text to wrap
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Spacing between filters and adjustment list

          // List of Adjustment Cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  _buildAdjustmentCard(
                    reason: 'Gift from vendor',
                    date: '14 Jan 2023',
                    warehouse: 'Warehouse 1',
                    adjustmentType: 'Bonus',
                    quantity: '5',
                  ),
                  // CORRECTED: Divider color and placement
                  if (index < 4) // Don't show divider after the last item (itemCount - 1)
                    const Divider(
                      thickness: 1.0,
                      color: Color(0xFFD7D6DB), // CORRECTED: Changed to light grey
                      height: 1.0, // Minimal height for the divider area
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper widget to build an individual adjustment card
  Widget _buildAdjustmentCard({
    required String reason,
    required String date,
    required String warehouse,
    required String adjustmentType,
    required String quantity,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                reason,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF242429),
                ),
              ),
              Row(
                children: [
                  Text(
                    warehouse,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF242429),
                    ),
                  ),
                  const SizedBox(width: 2), // CORRECTED: Reduced space to make icon closer
                  const Icon(Icons.more_vert, size: 20, color: Color(0xFF878594)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quantity',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6B6B6B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF878594),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    adjustmentType,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF878594),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    quantity,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF242429),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}