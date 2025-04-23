import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'househelp_homepage.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Skills> {
  final Color c1 = Color(0xFF2F2071); //fonts
  final Color c2 = Color(0xFFD9D7E4); //inside box

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
    print("spoekn");
  }

  bool isBabySelected = false;
  bool isBathroomSelected = false;
  bool isCarWashSelected = false;
  bool isCookingSelected = false;
  bool isGardeningSelected = false;
  bool isElderSelected = false;
  bool isToiletSelected = false;
  bool isSweepSelected = false;

  void toggleSelection(String job) {
    String speakTextValue = "";
    setState(() {
      if (job == 'baby') {
        isBabySelected = !isBabySelected;
        speakTextValue = 'Child care';
        if (isBabySelected) speakText(speakTextValue);
      } else if (job == 'bathroom') {
        isBathroomSelected = !isBathroomSelected;
        speakTextValue = 'Bathroom Cleaning';
        if (isBathroomSelected) speakText(speakTextValue);
      } else if (job == 'carwash') {
        isCarWashSelected = !isCarWashSelected;
        speakTextValue = 'Car Wash';
        if (isCarWashSelected) speakText(speakTextValue);
      } else if (job == 'cooking') {
        isCookingSelected = !isCookingSelected;
        speakTextValue = 'Cooking';
        if (isCookingSelected) speakText(speakTextValue);
      } else if (job == 'elder') {
        isElderSelected = !isElderSelected;
        speakTextValue = 'Elder Care';
        if (isElderSelected) speakText(speakTextValue);
      } else if (job == 'garden') {
        isGardeningSelected = !isGardeningSelected;
        speakTextValue = 'Gardening';
        if (isGardeningSelected) speakText(speakTextValue);
      } else if (job == 'sweep') {
        isSweepSelected = !isSweepSelected;
        speakTextValue = 'Sweep and Mop';
        if (isSweepSelected) speakText(speakTextValue);
      } else if (job == 'toilet') {
        isToiletSelected = !isToiletSelected;
        speakTextValue = 'Toilet cleaning';
        if (isToiletSelected) speakText(speakTextValue);
      }
    });
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
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 25.0,
                  bottom: 8.0,
                  right: 16.0,
                  top: 25.0), // Less padding
              child: Text(
                'Select your skills',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 38,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 120, top: 50),
            child: Row(children: [
              buildLanguageButton(
                  'assets/images/baby.png', isBabySelected, 'baby'),
              SizedBox(width: 40),
              buildLanguageButton(
                  'assets/images/bathroom.png', isBathroomSelected, 'bathroom'),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 120),
            child: Row(children: [
              buildLanguageButton(
                  'assets/images/carwash.png', isCarWashSelected, 'carwash'),
              SizedBox(width: 40),
              buildLanguageButton(
                  'assets/images/cooking.png', isCookingSelected, 'cooking'),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 120),
            child: Row(children: [
              buildLanguageButton(
                  'assets/images/elder.png', isElderSelected, 'elder'),
              SizedBox(width: 40),
              buildLanguageButton(
                  'assets/images/gardening.png', isGardeningSelected, 'garden'),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 120),
            child: Row(children: [
              buildLanguageButton(
                  'assets/images/sweep.png', isSweepSelected, 'sweep'),
              SizedBox(width: 40),
              buildLanguageButton(
                  'assets/images/toilet.png', isToiletSelected, 'toilet'),
            ]),
          ),
          SizedBox(
            height: 40,
          ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HousehelpHomepage()),
                    );
                  },
                  child: const Text('Next'),
                ),
              )),
        ],
      ),
    );
  }
}
