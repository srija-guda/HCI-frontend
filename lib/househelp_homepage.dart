import 'package:flutter/material.dart';
import 'package:testing_app/edit_profile_prof.dart';
import 'package:testing_app/view_profile_househelp.dart';
import 'package:testing_app/models/job_model.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HousehelpHomepage extends StatefulWidget {
  const HousehelpHomepage({super.key});

  @override
  State<HousehelpHomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HousehelpHomepage> {
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); // fonts
  final Color c2 = Color(0xFFCFE6E5); // accepted
  bool isApplied = false;
  FlutterTts flutterTts = FlutterTts();

  List<Job> appliedJobs = [];
  List<Job> availableJobs = [
    Job(
      date: DateTime(2025, 10, 15),
      startTime: TimeOfDay(hour: 17, minute: 0),
      endTime: TimeOfDay(hour: 18, minute: 0),
      price: 'Rs 200',
      task: 'Cooking',
    ),
    Job(
      date: DateTime(2025, 10, 16),
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 10, minute: 30),
      price: 'Rs 150',
      task: 'Elder Care',
    ),
  ];
  Future<void> configureTts() async {
    await flutterTts.setLanguage('hi-IN');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
  }

  void speakText(String text) async {
    await flutterTts.speak(text);
  }

  String getTaskImage(String task) {
    switch (task) {
      case 'Child Care':
        return 'assets/images/baby.png';
      case 'Bathroom Cleaning':
        return 'assets/images/bathroom.png';
      case 'Car Wash':
        return 'assets/images/carwash.png';
      case 'Cooking':
        return 'assets/images/cooking.png';
      case 'Elder Care':
        return 'assets/images/elder.png';
      case 'Gardening':
        return 'assets/images/gardening.png';
      case 'Sweep and mop':
        return 'assets/images/sweep.png';
      case 'Toilet Cleaning':
        return 'assets/images/toilet.png';
      default:
        return 'assets/images/misc.png';
    }
  }

  @override
  void initState() {
    super.initState();
    configureTts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: c1,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const ViewProfileHousehelp()), // Or your profile screen
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Jobs', style: _sectionTitleStyle()),
              ...appliedJobs.map((job) => buildJobCard(job, isApplied: true)),
              const SizedBox(height: 20),
              Text('Apply to Jobs', style: _sectionTitleStyle()),
              ...availableJobs
                  .map((job) => buildJobCard(job, isApplied: false)),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _sectionTitleStyle() {
    return TextStyle(
      fontFamily: 'Albert Sans',
      fontSize: 35,
      color: c1,
      fontWeight: FontWeight.w700,
    );
  }

  Widget buildJobCard(Job job, {required bool isApplied}) {
    return Card(
      color: isApplied ? c2 : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${job.date.day}/${job.date.month}/${job.date.year}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${job.startTime.format(context)} - ${job.endTime.format(context)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text(
                  job.price,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    speakText(job.task);
                  },
                  child: Image.asset(
                    getTaskImage(job.task),
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            if (!isApplied)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: c1,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    availableJobs.remove(job);
                    appliedJobs.add(job);
                  });
                },
                child: const Text('Apply'),
              )
            else
              Row(
                children: [
                  Image.asset('assets/images/raji.png'),
                  const SizedBox(width: 10),
                  const Text(
                    "Aruna H7-123",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
