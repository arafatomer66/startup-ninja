import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Ninja Dashboard'),
        backgroundColor: Colors.blueAccent,  // Simple, clean blue app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: 7,  // Total 7 sections (kits)
          itemBuilder: (context, index) {
            return _buildDashboardCard(
              context,
              icon: _getIconForSection(index),
              title: _getTitleForSection(index),
              onTap: () {
                // Navigate to the respective section
              },
            );
          },
        ),
      ),
    );
  }

  // Helper method to get the icon based on the section
  IconData _getIconForSection(int index) {
    switch (index) {
      case 0:
        return Icons.business;
      case 1:
        return Icons.production_quantity_limits;
      case 2:
        return Icons.people;
      case 3:
        return Icons.assignment;
      case 4:
        return Icons.local_shipping;
      case 5:
        return Icons.business_center;
      case 6:
        return Icons.account_balance_wallet;
      default:
        return Icons.help;
    }
  }

  // Helper method to get the title for each section
  String _getTitleForSection(int index) {
    switch (index) {
      case 0:
        return 'Formation Kit';
      case 1:
        return 'Product Kit';
      case 2:
        return 'HR Kit';
      case 3:
        return 'SOP Kit';
      case 4:
        return 'Procurement Kit';
      case 5:
        return 'Business Kit';
      case 6:
        return 'Finance Kit';
      default:
        return 'Unknown';
    }
  }

  // Build each card for the Dashboard
  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
      }) {
    return Card(
      elevation: 4,  // Moderate shadow for a clean, light look
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),  // Smooth corners
      ),
      color: Colors.white,  // Light background for each card
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blueAccent.withOpacity(0.2),  // Subtle splash effect
        highlightColor: Colors.blue.withOpacity(0.1),  // Light highlight effect
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),  // Simple, clean icons
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,  // Readable font size
                fontWeight: FontWeight.bold,  // Bold text for visibility
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}