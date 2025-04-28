import 'package:bublu1/appointments_screen.dart';
import 'package:bublu1/billing.dart';
import 'package:bublu1/billing1.dart';
import 'package:bublu1/book_appointment.dart';

import 'package:bublu1/dashboardscreen.dart';
import 'package:bublu1/replica.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePage()),
    );
  }
}

// Screens
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    AppointmentsScreen(),
    MyWidget(),
    BookAppointmentScreen(),
    BillingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() => _selectedIndex = 2);
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.teal,
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.white : Colors.black,
              onPressed: () => setState(() => _selectedIndex = 0),
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              color: _selectedIndex == 1 ? Colors.white : Colors.black,
              onPressed: () => setState(() => _selectedIndex = 1),
            ),
            SizedBox(width: 40), // spacing for FAB
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: _selectedIndex == 3 ? Colors.white : Colors.black,
              onPressed: () => setState(() => _selectedIndex = 3),
            ),
            IconButton(
              icon: Icon(Icons.receipt_long),
              color: _selectedIndex == 4 ? Colors.white : Colors.black,
              onPressed: () => setState(() => _selectedIndex = 4),
            ),
          ],
        ),
      ),
    );
  }
}
