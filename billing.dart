import 'package:flutter/material.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedDoctor = 'Select';
  String selectValue = 'Select';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: Text(
                  'Billing',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Color(0xFF738ED3),
                  borderRadius: BorderRadius.circular(20),
                ),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: -30),
                labelColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedLabelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(text: "Patients Prescription"),
                  Tab(text: "Patients Bill Generator"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ), // Less padding
              child: Container(
                height: 45, // Slightly bigger for better touch area
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
                      vertical: 10,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Text(
                    'Select Doctor:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedDoctor,
                          items: const [
                            DropdownMenuItem(
                              value: 'Select',
                              child: Text('Select'),
                            ),
                            DropdownMenuItem(
                              value: 'Dr. Smith',
                              child: Text('Dr. Smith'),
                            ),
                            DropdownMenuItem(
                              value: 'Dr. John',
                              child: Text('Dr. John'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedDoctor = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [PatientPrescription(), PatientBillGenerator()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PatientPrescription() {
    return Container(
      height: 20,
      // color: Color(0xFF9CA3AF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 20,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Pateint Details",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Patient ID:")]),
            ),

            //Patient Name Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Name:")]),
            ),

            //Patient Age, Sex, Height Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Age:"), Text("Sex:"), Text("Height:173")],
              ),
            ),

            //Patient wieght, bmi, BP Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Weight:"), Text("BMI:"), Text("BP:90/120")],
              ),
            ),

            SizedBox(height: 30),

            //Prescription Deatil
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 20,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Prescription Details:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            //Name Of Medicine
            Text("Name Of Medicine"),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                left: 30,
                right: 30,
                bottom: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 120),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        'Select',
                        'Medicine 1',
                        'Medicine 2',
                        'Medicine 3',
                        'Medicine 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            SizedBox(height: 20),

            //Input for Dosage
            Text("Dosage:"),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                  //hintText: 'Add Dosage',
                  //prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(), // <-- underline only
                ),
              ),
            ),

            SizedBox(height: 20),

            //Input for Duration:
            Text("Duration:"),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                  //hintText: 'Add Duration:',
                  //prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(), // <-- underline only
                ),
              ),
            ),

            SizedBox(height: 20),

            //Input for Instruction:
            Text("Instruction:"),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                  //hintText: 'Add Instruction:',
                  //prefixIcon: Icon(Icons.search),
                  border: UnderlineInputBorder(), // <-- underline only
                ),
              ),
            ),

            SizedBox(height: 40),

            //Button
            TextButton(
              onPressed: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFF738ED3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Prescription",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PatientBillGenerator() {
    return Container(
      height: 20,
      // color: Color(0xFF9CA3AF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 20,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Pateint Details",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Patient ID:")]),
            ),

            //Patient Name Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Name:")]),
            ),

            //Patient Age, Sex, Height Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Age:"), Text("Sex:"), Text("Height:173")],
              ),
            ),

            //Patient wieght, bmi, BP Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Weight:"), Text("BMI:"), Text("BP:90/120")],
              ),
            ),

            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 20,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Prescription Details:",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Name Of The Medicine:")]),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Dosage:")]),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Duration:")]),
            ),

            //Patient id Row
            Container(
              margin: EdgeInsets.only(top: 5, right: 30, left: 30, bottom: 5),
              child: Row(children: [Text("Instruction:")]),
            ),

            SizedBox(height: 30),

            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF9CA3AF),
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 20,
                      bottom: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Billing Details",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),

            //Name Of Medicine
            Text("Name Of Medicine"),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                left: 30,
                right: 30,
                bottom: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 120),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        'Select',
                        'Medicine 1',
                        'Medicine 2',
                        'Medicine 3',
                        'Medicine 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            //Medical bill
            Text("Medical Bill"),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                left: 30,
                right: 30,
                bottom: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 120),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        'Select',
                        'Medicine 1',
                        'Medicine 2',
                        'Medicine 3',
                        'Medicine 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            //New Patient Or follow Up
            Text("New Patient Or Follow Up"),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                left: 30,
                right: 30,
                bottom: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 120),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        'Select',
                        'Medicine 1',
                        'Medicine 2',
                        'Medicine 3',
                        'Medicine 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            //Payment Mode
            Text("Payment Mode"),
            Container(
              margin: const EdgeInsets.only(
                top: 8,
                left: 30,
                right: 30,
                bottom: 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 120),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectValue = newValue!;
                    });
                  },
                  items:
                      <String>[
                        'Select',
                        'Medicine 1',
                        'Medicine 2',
                        'Medicine 3',
                        'Medicine 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                ),
              ),
            ),

            SizedBox(height: 30),

            //Button
            TextButton(
              onPressed: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: Color(0xFF738ED3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    "Prescription",
                    style: TextStyle(color: Colors.black),
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
