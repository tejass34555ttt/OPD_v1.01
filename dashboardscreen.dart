import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [Icon(Icons.notifications_none)],
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 1),
          Padding(
            padding: EdgeInsets.only(top: 18, bottom: 16, left: 60, right: 60),
            child: Container(
              height:
                  40, // Adjust this value to change the height of the search bar
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 10,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(right: 40, left: 40),
              crossAxisCount: 2,
              crossAxisSpacing: 80,
              mainAxisSpacing: 42,
              children: [
                buildCard('New Patients', 24, Icons.person, Colors.blue[100]!),
                buildCard(
                  'Total OPD Patients',
                  24,
                  Icons.groups,
                  Colors.green[100]!,
                ),
                buildCard(
                  'Follow-Up Patients',
                  24,
                  Icons.refresh,
                  Colors.purple[100]!,
                ),
                buildCard(
                  'Check-Out Patients',
                  24,
                  Icons.check_circle_outline,
                  Colors.red[100]!,
                ),
                buildCard(
                  'Waiting Patients',
                  24,
                  Icons.hourglass_bottom,
                  Colors.orange[100]!,
                ),
                buildCard(
                  'OPD-Paid',
                  24,
                  Icons.attach_money,
                  Colors.lightBlue[100]!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(String title, int count, IconData icon, Color color) {
    return Container(
      height: 140,
      width: 160,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon and Number in one row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: Colors.black),
              ),
              const SizedBox(width: 8),
              Text(
                '$count',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
