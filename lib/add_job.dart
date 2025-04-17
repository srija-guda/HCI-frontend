import 'package:flutter/material.dart';
import 'faculty_homepage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 50.0, right: 16.0),
        child: Column(
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
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                border: OutlineInputBorder(),
                labelText: 'DD/MM/YY',
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
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                border: OutlineInputBorder(),
                labelText: 'Eg: 5 30 pm',
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
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                border: OutlineInputBorder(),
                labelText: 'Eg: 6 30 pm',
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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
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
            SizedBox(height: 50,),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c1,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FacultyHomepage()),
                    );
                  },
                  child: const Text('Cancel'),
                ),
                SizedBox(width: 160,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: c1,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FacultyHomepage()),
                    );
                  },
                  child: const Text('Post Job'),
                ),
              ]

            )

          ],
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
