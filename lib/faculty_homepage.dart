import 'package:flutter/material.dart';
import 'add_job.dart';

class FacultyHomepage extends StatefulWidget {
  const FacultyHomepage({super.key});

  @override
  State<FacultyHomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FacultyHomepage> {
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); // fonts
  final Color c2 = Color(0xFFCFE6E5); // accepted

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 50.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Accepted Jobs',
              style: TextStyle(
                fontFamily: 'Albert Sans',
                fontSize: 35,
                color: c1,
                fontWeight: FontWeight.w700,
              ),
            ),
            Card(
              color: c2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Monday, 15th October',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [Text('5pm - 6pm',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      ),
                        SizedBox(width: 160,),
                        Text('Rs 200',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ],
                    ),
                    SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/images/toilet.png', scale: 2,),
                      SizedBox(width: 20,),
                      Image.asset('assets/images/gardening.png', scale: 2,),
                    ]
                  ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset('assets/images/raji.png'),
                        SizedBox(width: 10,),
                        Text("Accepted by Raji",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),),
                      ],

                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Posted Jobs',
              style: TextStyle(
                fontFamily: 'Albert Sans',
                fontSize: 35,
                color: c1,
                fontWeight: FontWeight.w700,
              ),
            ),
            Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Monday, 15th October',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [Text('5pm - 6pm',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                        SizedBox(width: 160,),
                        Text('Rs 200',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                        children: [
                          Image.asset('assets/images/cooking.png', scale: 2,),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/elder.png', scale: 2,),
                        ]
                    ),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddJob()),
                    );
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: c1, // use your custom color
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }

}
