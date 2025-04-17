import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:testing_app/are_you.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<LangScreen> {
  final Color c1 = Color(0xFF2F2071); //fonts
  FlutterTts flutterTts = FlutterTts();
@override
  void initState(){
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

  bool isHindiSelected = false;
  bool isEnglishSelected = false;
  bool isTeluguSelected = false;

  void toggleSelection(String language) {
    String speakTextValue = "";
    setState(() {
      if (language == 'hindi') {
        isHindiSelected = !isHindiSelected;
        speakTextValue = 'Hindi';
      } else if (language == 'english') {
        isEnglishSelected = !isEnglishSelected;
        speakTextValue = 'English';

      } else if (language == 'telugu') {
        isTeluguSelected = !isTeluguSelected;
        speakTextValue = 'Telugu';

      }
    });
    if(isEnglishSelected || isHindiSelected || isTeluguSelected)
      {
        speakText(speakTextValue);
      }
  }

  Widget buildLanguageButton(String imagePath, bool isSelected, String language) {
    return InkWell(onTap: () => toggleSelection(language),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: isSelected ? Border.all(color: Colors.blue, width: 4) : null,
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
              )
          )
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
          Image.asset('assets/images/front_pic.png',
              scale: 2.0),
          //const SizedBox(height: 10),
          Center(child: Text(
            'Pick a Language',
            style: TextStyle(
              fontFamily: 'Albert Sans',
              fontSize: 30,
              color: c1,
              fontWeight: FontWeight.w700,
            ),
          ),
          ),
          const SizedBox(height: 20),
          Center(child:
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLanguageButton('assets/images/hindi.png', isHindiSelected, 'hindi'),
                const SizedBox(width: 50),
                buildLanguageButton('assets/images/english.png', isEnglishSelected, 'english'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          buildLanguageButton('assets/images/telugu.png', isTeluguSelected, 'telugu'),
          const SizedBox(height: 20),
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
                      MaterialPageRoute(builder: (context) => const AreYouScreen()),
                    );
                  },

                  child: const Text('Next'),
                ),
              )
          ),
        ],
      ),
    );
  }
}

