import 'package:flutter/material.dart';
import 'bookin_schedule_screeen.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                filled: true,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Select Doctor'),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: null,
              hint: const Text("Select"),
              items:
                  ['Dr. A', 'Dr. B']
                      .map(
                        (doc) => DropdownMenuItem(value: doc, child: Text(doc)),
                      )
                      .toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder:
                    (context, index) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: const Text("Name: "),
                        subtitle: const Text("Date: "),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade400,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const BookingScheduleScreen(),
                              ),
                            );
                          },
                          child: const Text("Book"),
                        ),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
