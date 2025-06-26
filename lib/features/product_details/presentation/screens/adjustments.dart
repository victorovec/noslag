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
      color: const Color(0xffF2F1F3),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Filter and Search Hint Section
            Row(
              children: [
                Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: const Color(0xFFD7D6DB)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedStatus,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF878594)),
                      selectedItemBuilder: (BuildContext context) {
                        return <String>['All', 'Approved', 'Pending', 'Rejected']
                            .map((String value) {
                          return Row(
                            children: [
                              const Text(
                                'Status ',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF242429),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                value,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF878594),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      },
                      items: <String>['All', 'Approved', 'Pending', 'Rejected']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
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
                      isDense: true,
                      isExpanded: true,
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                Expanded(
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline, size: 14, color: Color(0xFF878594)),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          'Search by Date, Warehouse, Reason and Description',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF878594),
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Updated List of Adjustment Cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Column
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Gift from vendor',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF242429),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Quantity',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF6B6B6B),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '31 Jan 2023',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF878594),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Second Column
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  'Warehouse 1',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF242429),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Bonus',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF878594),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF242429),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Third Column: More Icon
                          const Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.more_vert, size: 20, color: Color(0xFF878594)),
                          ),
                        ],
                      ),
                    ),

                    if (index < 4)
                      const Divider(
                        thickness: 1.0,
                        color: Color(0xFFD7D6DB),
                        height: 1.0,
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
