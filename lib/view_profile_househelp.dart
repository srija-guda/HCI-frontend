import 'package:flutter/material.dart';

class ViewProfileHousehelp extends StatefulWidget {
  const ViewProfileHousehelp({super.key});

  @override
  State<ViewProfileHousehelp> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<ViewProfileHousehelp> {
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); //fonts
  final Color c2 = Color(0xFF92D0CD); //top bg
  final Color c3 = Color(0xFF49454F); //text color

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
              buildProfCoverImage(),
              Positioned(
                top: top,
                child: buildProfProfileImage(),
              ),
            ],
          ),
          const SizedBox(height: 70),
          Center(
              child: Column(
                  children: [
                    Text(
                      '<Househelp Name>',
                      style: TextStyle(
                        fontFamily: 'Albert Sans',
                        fontSize: 20,
                        color: c1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '+91 12345 67890',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: c3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center, // optional, centers the row
                          children: [
                            Image.asset('assets/images/toilet.png', scale: 2),
                            SizedBox(width: 20),
                            Image.asset('assets/images/gardening.png', scale: 2),
                            SizedBox(width: 20),
                            Image.asset('assets/images/cooking.png', scale: 2),
                          ],
                        ),
                      ),
                    ),


                  ]

              )

          )

        ],
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

