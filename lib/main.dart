import 'package:flutter/material.dart';
import 'package:testing_app/add_job.dart';
import 'package:testing_app/edit_profile_prof.dart';
import 'package:testing_app/faculty_homepage.dart';
import 'package:testing_app/househelp_homepage.dart';
import 'package:testing_app/skills.dart';
import 'package:testing_app/view_profile_househelp.dart';
import 'are_you.dart';
import 'lang_screen.dart';
import 'view_prof_profile.dart';
import 'skills.dart';
import 'add_job.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color c1 = Color(0xFF2F2071);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/start.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Button on top of image
          Positioned(
            bottom: 70,
            right: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: c1,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LangScreen()),
                );
              },
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
