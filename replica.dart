import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _dobDateController = TextEditingController();

  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  String? selectedDoctor;
  String? selectedGender;

  final TextEditingController _scheduleDateController = TextEditingController();
  final TextEditingController _scheduletimeController = TextEditingController();

  Future<void> _selectDobDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobDateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _dobDateController.dispose();
    _timeController.dispose();
    _nameController.dispose();
    // _mobileController.dispose();
    //_addressController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adds space around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "OPD Date",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              //SizedBox(height: 10),
              TextFormField(
                controller: _dateController,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Select Date',

                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 15),

              //1 select the OPD Time
              Text(
                "OPD Time",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextFormField(
                controller: _timeController,
                readOnly: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Select Time',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 120, 117, 117),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  suffixIcon: Icon(Icons.access_time),
                ),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime != null) {
                    setState(() {
                      _timeController.text = pickedTime.format(
                        context,
                      ); // 12-hour format with AM/PM
                    });
                  }
                },
              ),

              SizedBox(height: 15),

              //2 Select the Doctor
              Text(
                "Doctor",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              DropdownButtonFormField<String>(
                value: selectedDoctor,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDoctor = newValue;
                  });
                },

                items:
                    ['Dr. Sharma', 'Dr. Verma', 'Dr. Kapoor']
                        .map(
                          (doctor) => DropdownMenuItem(
                            value: doctor,
                            child: Center(
                              child: Text(doctor),
                            ), // Center selected items
                          ),
                        )
                        .toList(),
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                hint: Center(
                  child: Text(
                    'Select Doctor',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 120, 117, 117),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                isExpanded: true, // Required for centering
                alignment: Alignment.center, // Center the selected value
              ),
              SizedBox(height: 15),

              // 3 Enter the Name
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              //SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.name,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Name',

                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
              ),
              SizedBox(height: 15),

              //  4 Enter the Gender
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
                items:
                    ['Male', 'Female']
                        .map(
                          (doctor) => DropdownMenuItem(
                            value: doctor,
                            child: Center(
                              child: Text(doctor),
                            ), // Center selected items
                          ),
                        )
                        .toList(),

                // SizedBox(height: 10), // Space between text and field
                //TextFormField(
                decoration: InputDecoration(
                  hintText: 'Select Gender',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
                hint: Center(
                  child: Text(
                    'Select Gender',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 120, 117, 117),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                isExpanded: true, // Required for centering
                alignment: Alignment.center, // Center the s
              ),
              SizedBox(height: 15),

              // 5 enter Date Of Birth
              Text(
                "DOB",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _dobDateController,
                keyboardType: TextInputType.number,
                readOnly: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Select Date',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () => _selectDobDate(context),
              ),

              SizedBox(height: 15),

              //6  enter the Age
              Text(
                "Age",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Age',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
              ),
              SizedBox(height: 15),

              //7 Enter the Height in cm
              Text(
                "Height(in cm)",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              //SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Height in cm',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
              ),
              SizedBox(height: 15),

              //8  enter the weight in kg
              Text(
                "Weight(in kg)",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter weight in kg',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
              ),
              SizedBox(height: 15),

              //9  enter the Mobile no
              Text(
                "Mobile No.",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              //SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _mobileNoController,
                keyboardType: TextInputType.number,
                //controller: _dateController,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Mob no',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                ),
              ),
              SizedBox(height: 15),

              //10  Patient address
              Text(
                "Patient Add.",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _addressController,
                keyboardType: TextInputType.name,
                //controller: _dateController,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter the adrress',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 120, 117, 117),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                  contentPadding: EdgeInsets.only(bottom: 0),
                ),
              ),

              SizedBox(height: 15),

              //11  Adding reference person name
              Text(
                "Reference(if any)",
                style: TextStyle(
                  fontSize: 15,
                  color: const Color.fromARGB(255, 14, 14, 14),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10), // Space between text and field
              TextFormField(
                controller: _referenceController,
                keyboardType: TextInputType.name,
                readOnly: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Reference',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      120,
                      117,
                      117,
                    ), // Color of label
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  alignLabelWithHint: true, // Centers the label
                  border: UnderlineInputBorder(), // Underline only
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 120, 117, 117),
                      width: 2, // Focused border style
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), // Default state
                  ),
                  contentPadding: EdgeInsets.only(bottom: 0),
                ),
              ),

              SizedBox(height: 15),

              //12 Add patient button
              SizedBox(height: 50),

              SizedBox(
                //height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,

                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      openDialogueBox();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF738ED3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add Patient',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialogueBox() {
    String nameOfPatient = _nameController.text.toString();
    String consultingDoctor = selectedDoctor ?? 'No doctor selected';

    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                "Booking Appointment Details",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Consulting Doctor: $consultingDoctor",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Patient Name: $nameOfPatient",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Schedule Appointment",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Select Date",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _scheduleDateController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Select Date',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 120, 117, 117),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        alignLabelWithHint: true,
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: Icon(Icons.calendar_today, size: 20),
                      ),
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            _scheduleDateController.text =
                                "${picked.day}/${picked.month}/${picked.year}";
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Select Time",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  TextFormField(
                    controller: _scheduletimeController,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Select Time',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 120, 117, 117),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: Icon(Icons.access_time, size: 20),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _scheduletimeController.text = pickedTime.format(
                            context,
                          );
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Color(0xFF738ED3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Book Appointment",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
