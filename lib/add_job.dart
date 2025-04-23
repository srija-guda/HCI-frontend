import 'package:flutter/material.dart';
import 'faculty_homepage.dart';

import 'package:testing_app/models/job_model.dart';

class AddJob extends StatefulWidget {
  const AddJob({super.key});

  @override
  State<AddJob> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddJob> {
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); // fonts
  final Color c2 = Color(0xFFD9D7E4); // top bg
  final Color c3 = Color(0xFF49454F); // text color
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  String? selectedTask;
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Post a New Job',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 40,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Date',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 25,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : "Select a date",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Start Time',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 25,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedStartTime = picked;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    selectedStartTime != null
                        ? selectedStartTime!.format(context)
                        : "Select start time",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'End Time',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 25,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              InkWell(
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedEndTime = picked;
                    });
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    selectedEndTime != null
                        ? selectedEndTime!.format(context)
                        : "Select end time",
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Price',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 25,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  border: OutlineInputBorder(),
                  labelText: 'Eg: Rs. 200',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tasks',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 25,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedTask,
                decoration: InputDecoration(
                  labelText: 'Select Task',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedTask = newValue;
                  });
                },
                items: [
                  'Child Care',
                  'Bathroom Cleaning',
                  'Car Wash',
                  'Cooking',
                  'Elder Care',
                  'Gardening',
                  'Sweep and mop',
                  'Toilet Cleaning',
                  'Miscellaneous',
                ].map<DropdownMenuItem<String>>((String task) {
                  return DropdownMenuItem<String>(
                    value: task,
                    child: Text(task),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c1,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FacultyHomepage()),
                    );
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c1,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (selectedDate != null &&
                        selectedStartTime != null &&
                        selectedEndTime != null &&
                        selectedTask != null) {
                      Navigator.pop(
                          context,
                          Job(
                            date: selectedDate!,
                            startTime: selectedStartTime!,
                            endTime: selectedEndTime!,
                            price: priceController.text,
                            task: selectedTask!,
                          ));
                    }
                  },
                  child: const Text('Post Job'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfCoverImage() => Container(
        color: c2,
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: c2,
        backgroundImage: const NetworkImage(
          'https://a0.anyrgb.com/pngimg/1600/696/user-login-linux-kernel-answer-user-profile-chen-account-login-github-thumbnail-avatar.png',
        ),
      );
}
