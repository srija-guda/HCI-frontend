import 'package:flutter/material.dart';
import 'faculty_homepage.dart';

class EditProfileProf extends StatefulWidget {
  const EditProfileProf({super.key});

  @override
  State<EditProfileProf> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<EditProfileProf> {
  final _text = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isPhoneValid = true;
  bool _validate = false;
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); //fonts
  final Color c2 = Color(0xFF92D0CD); //top bg

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double top = coverHeight - profileHeight / 2;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              buildCoverImage(),
              Positioned(
                top: top,
                child: buildProfileImage(),
              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit Profile Photo'),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 20,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Keep horizontal padding
            child: TextField(
              controller: _text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Reduce vertical padding
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                errorText: _validate ? 'Value cannot be empty' : null,
              ),
            ),
          ),
          const SizedBox(height: 40),
          //const SizedBox(height: 10),

          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0), // Less padding
              child: Text(
                'Address',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 20,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Keep horizontal padding
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Reduce vertical padding
                border: OutlineInputBorder(),
                labelText: 'Eg: C214',
              ),
            ),
          ),
          //const SizedBox(height: 10),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 8.0), // Less padding
              child: Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'Albert Sans',
                  fontSize: 20,
                  color: c1,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Keep horizontal padding
            child: TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0), // Reduce vertical padding
                border: OutlineInputBorder(),
                labelText: '+91',
                errorText: _isPhoneValid ? null : 'Phone Number must be 10 digits',

              ),
            ),
          ),
          //const SizedBox(height: 10),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: c1,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _text.text.isEmpty ? _validate = true : _validate = false;
                _phoneController.text.length == 10 ? _isPhoneValid = true : _isPhoneValid = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FacultyHomepage()),
              );
            },
            child: const Text('Save Changes'),
          ),

        ],
      ),
    );
  }


  Widget buildCoverImage() => Container(
    color: c2,
    width: double.infinity,
    height: coverHeight,
  );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: c2,
    backgroundImage: const NetworkImage(
      'https://a0.anyrgb.com/pngimg/1600/696/user-login-linux-kernel-answer-user-profile-chen-account-login-github-thumbnail-avatar.png',
    ),
  );
}

