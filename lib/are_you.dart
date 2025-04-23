import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart'; // Add this import if not already present
import 'package:testing_app/edit_profile_prof.dart';
import 'package:testing_app/faculty_homepage.dart';
import 'package:testing_app/lang_screen.dart';
import 'package:testing_app/skills.dart';

class AreYouScreen extends StatefulWidget {
  const AreYouScreen({super.key});

  @override
  State<AreYouScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AreYouScreen> {
  final Color c1 = Color(0xFF2F2071); //fonts
  bool isFacultySelected = false;
  bool isHousehelpSelected = false;

  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    configureTts();
  }

  Future<void> configureTts() async {
    await flutterTts.setLanguage('hi-IN');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
  }

  void speakText(String text) async {
    await flutterTts.speak(text);
    print("spoken");
  }

  bool isHindiSelected = false;
  bool isEnglishSelected = false;
  bool isTeluguSelected = false;

  void toggleSelection(String job) {
    String speakTextValue = "";
    setState(() {
      if (job == 'faculty') {
        isFacultySelected = true;
        isHousehelpSelected = false;
        speakTextValue = 'Faculty or Staff';
      } else if (job == 'househelp') {
        isFacultySelected = false;
        isHousehelpSelected = true;
        speakTextValue = 'Househelp';
      }
    });

    speakText(speakTextValue);
  }

  Widget buildLanguageButton(
      String imagePath, bool isSelected, String language) {
    return InkWell(
      onTap: () => toggleSelection(language),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border:
                  isSelected ? Border.all(color: Colors.blue, width: 4) : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath, scale: 1.5),
          ),
          if (isSelected)
            Opacity(
              opacity: 0.3,
              child: Container(
                width: 100,
                height: 128,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 20,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Text(
                  'I am a ...',
                  style: TextStyle(
                    fontFamily: 'Albert Sans',
                    fontSize: 38,
                    color: c1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            buildLanguageButton(
                'assets/images/faculty.png', isFacultySelected, 'faculty'),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Faculty/Staff',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 30,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30),
            buildLanguageButton('assets/images/househelp.png',
                isHousehelpSelected, 'househelp'),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Househelp',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 30,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c1,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (isFacultySelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfileProf()),
                      );
                    } else if (isHousehelpSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Skills()),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
