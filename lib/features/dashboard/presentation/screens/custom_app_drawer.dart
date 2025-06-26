import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noslag/core/constants/routes.dart';
// Enum to represent different menu items for easier tracking and selection management
enum MenuItemType {
  selfService,
  dashboard,
  product, // Parent item for expansion
  allProducts, // Sub-item of Product
  priceList,  // Sub-item of Product
  customers,
  vendors,
  transactions,
  reports,
  warehouses,
  tasks,
  settings,
  logout,
}

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({super.key});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  // Currently selected menu item, initialized to 'All Products' to match the screenshot.
  MenuItemType _selectedMenuItem = MenuItemType.allProducts;
  // State for the 'Product' menu item's expansion, initialized to true to match the screenshot.
  bool _isProductExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // The drawer has a white background
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            // --- Noslag Logo Section ---
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('assets/icons/LOGO.png'),
            ),
            // --- Menu Items List ---
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero, // Remove default ListView padding
                children: [
                  _buildDrawerItem(
                    icon: Icons.access_time, // Placeholder icon for Self Service
                    title: 'Self Service',
                    itemType: MenuItemType.selfService,
                  ),
                  _buildDrawerItem(
                    icon: Icons.dashboard_outlined, // Icon for Dashboard
                    title: 'Dashboard',
                    itemType: MenuItemType.dashboard,
                  ),
                  // --- Product (Expandable) Item ---
                  _buildExpandableDrawerItem(
                    icon: Icons.inventory_2_outlined, // Icon for Product
                    title: 'Product',
                    itemType: MenuItemType.product,
                    isExpanded: _isProductExpanded,
                    onTap: () {
                      setState(() {
                        _isProductExpanded = !_isProductExpanded; // Toggle expansion
                      });
                    },
                    subItems: [
                      _buildDrawerItem(
                        icon: Icons.circle, // Small circle icon for sub-item
                        title: 'All Products',
                        itemType: MenuItemType.allProducts,
                        isSubItem: true, // Mark as sub-item for indentation
                      ),
                      _buildDrawerItem(
                        icon: Icons.circle, // Small circle icon for sub-item
                        title: 'Price List',
                        itemType: MenuItemType.priceList,
                        isSubItem: true,
                      ),
                    ],
                  ),
                  _buildDrawerItem(
                    icon: Icons.people_outline, // Icon for Customers
                    title: 'Customers',
                    itemType: MenuItemType.customers,
                  ),
                  _buildDrawerItem(
                    icon: Icons.person_outline, // Placeholder icon for Vendors
                    title: 'Vendors',
                    itemType: MenuItemType.vendors,
                  ),
                  _buildDrawerItem(
                    icon: Icons.receipt_long_outlined, // Icon for Transactions
                    title: 'Transactions',
                    itemType: MenuItemType.transactions,
                  ),
                  _buildDrawerItem(
                    icon: Icons.bar_chart_outlined, // Icon for Reports
                    title: 'Reports',
                    itemType: MenuItemType.reports,
                  ),
                  _buildDrawerItem(
                    icon: Icons.warehouse_outlined, // Icon for Warehouses
                    title: 'Warehouses',
                    itemType: MenuItemType.warehouses,
                  ),
                  _buildDrawerItem(
                    icon: Icons.assignment_outlined, // Icon for Tasks
                    title: 'Tasks',
                    itemType: MenuItemType.tasks,
                  ),
                  _buildDrawerItem(
                    icon: Icons.settings_outlined, // Icon for Settings
                    title: 'Settings',
                    itemType: MenuItemType.settings,
                  ),
                  _buildDrawerItem(
                    icon: Icons.logout_outlined, // Icon for Logout
                    title: 'Logout',
                    itemType: MenuItemType.logout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for non-expandable drawer items and sub-items
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required MenuItemType itemType,
    bool isSubItem = false, // Flag to apply sub-item specific styling (indentation, icon size)
  }) {
    final bool isSelected = (_selectedMenuItem == itemType); // Check if this item is currently selected
    final Color iconColor = isSelected ? Colors.white : const Color(0xFF878594); // White for selected, grey for others
    final Color textColor = isSelected ? Colors.white : const Color(0xFF242429); // White for selected, dark grey for others
    final Color backgroundColor = isSelected ? const Color(0xFF1D2A5D) : Colors.transparent; // Dark background for selected

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMenuItem = itemType; // Update selected item
          // If a non-sub-item is selected and it's not the 'Product' header itself, collapse 'Product'
          if (!isSubItem && itemType != MenuItemType.product) {
            _isProductExpanded = false;
          }
        });
        Navigator.pop(context); // Uncomment to close drawer after selection
        // Implement actual navigation logic here based on itemType
         if (itemType == MenuItemType.allProducts) {
          Get.toNamed(RoutesConstant.products); // Navigate to Products screen
        }
      },
      child: Container(
        margin: EdgeInsets.only(
          left: isSubItem ? 40.0 : 16.0, // Indent sub-items
          right: 16.0,
          bottom: 8.0, // Spacing between menu items
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0), // Rounded corners for selected item
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: isSubItem ? 10 : 22, // Smaller icon for sub-items
            ),
            SizedBox(width: isSubItem ? 12 : 16), // Adjust space for sub-items
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for expandable drawer items (like 'Product')
  Widget _buildExpandableDrawerItem({
    required IconData icon,
    required String title,
    required MenuItemType itemType,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> subItems,
  }) {
    // Check if the parent item itself is selected OR if one of its sub-items is selected
    final bool isSelected = (_selectedMenuItem == itemType ||
        (itemType == MenuItemType.product &&
            (_selectedMenuItem == MenuItemType.allProducts ||
                _selectedMenuItem == MenuItemType.priceList)));

    final Color iconColor = isSelected ? Colors.white : const Color(0xFF878594);
    final Color textColor = isSelected ? Colors.white : const Color(0xFF242429);

    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF242429) : Colors.transparent, // Background for selected "Product"
              borderRadius: BorderRadius.circular(10.0),
              // Conditional blue vertical bar on the right when expanded
              border: isExpanded && itemType == MenuItemType.product
                  ? const Border(
                      right: BorderSide(
                        color: Color(0xFF13A9F4), // Blue highlight color
                        width: 4.0,
                      ),
                    )
                  : null,
            ),
            child: Row(
              children: [
                Icon(icon, color: iconColor, size: 22),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, // Up/down arrow for expansion
                  color: isSelected ? Colors.white : const Color(0xFF878594),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        // Display sub-items only if the parent is expanded
        if (isExpanded)
          Column(
            children: subItems,
          ),
      ],
    );
  }
}