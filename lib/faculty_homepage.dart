import 'package:flutter/material.dart';
import 'package:testing_app/main.dart';
import 'package:testing_app/models/job_model.dart';
import 'package:testing_app/view_prof_profile.dart';
import 'add_job.dart';

class FacultyHomepage extends StatefulWidget {
  final Job? postedJob;

  const FacultyHomepage({super.key, this.postedJob});

  @override
  State<FacultyHomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FacultyHomepage> {
  final double profileHeight = 100;
  final double coverHeight = 150;
  final Color c1 = Color(0xFF2F2071); // fonts
  final Color c2 = Color(0xFFCFE6E5); // accepted
  List<Job> postedJobs = [];

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
                        const ViewProfProfile()), // Or your profile screen
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 50.0, right: 16.0),
        child: SingleChildScrollView(
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
                      Text(
                        'Monday, 15th October',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '5pm - 6pm',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Rs 200',
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
                      Row(children: [
                        Image.asset(
                          'assets/images/toilet.png',
                          scale: 2,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/images/gardening.png',
                          scale: 2,
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/raji.png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Accepted by Raji",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.cancel)
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
              Column(
                children: postedJobs.map((job) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${job.date.day}/${job.date.month}/${job.date.year}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${job.startTime.format(context)} - ${job.endTime.format(context)}',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                job.price,
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: Image.asset(
                                  getTaskImage(job.task),
                                  fit: BoxFit
                                      .contain, // makes sure it scales proportionally
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 8.0),
                  child: InkWell(
                    onTap: () async {
                      final Job? newJob = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AddJob()),
                      );

                      if (newJob != null) {
                        setState(() {
                          postedJobs.add(newJob);
                        });
                      }
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
      ),
    );
  }
}
