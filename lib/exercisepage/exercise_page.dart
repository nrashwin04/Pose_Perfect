import 'package:flutter/material.dart';
import 'package:yoga_two/exercisepage/beginner/cobra_pose.dart';
import 'package:yoga_two/exercisepage/beginner/downward_dog.dart'; // Import pose-specific files
import 'package:yoga_two/exercisepage/beginner/child_pose.dart';
import 'package:yoga_two/exercisepage/beginner/mountain_pose.dart';
import 'package:yoga_two/exercisepage/beginner/tree_pose.dart';
import 'package:yoga_two/exercisepage/beginner/warrior1_pose.dart'; // Add similar imports for other poses

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Poses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: YogaStudio(),
    );
  }
}

class YogaStudio extends StatelessWidget {
  final List<Map<String, dynamic>> beginnerPoses = [
    {"name": "Mountain Pose", "image": "assets/beginner/beg_mountain.jpg", "page": MountainPosePage()},
    {"name": "Child's Pose", "image": "assets/beginner/beg_child.jpg", "page": ChildPosePage()},
    {"name": "Downward Dog", "image": "assets/beginner/beg_dog.jpg", "page": DownwardDogPage()},
    {"name": "Cobra Pose", "image": "assets/beginner/beg_cobra.jpg", "page": CobraPosePage()},
    {"name": "Warrior I", "image": "assets/beginner/beg_warrior1.jpg", "page": Warrior1PosePage()},
    {"name": "Tree Pose", "image": "assets/beginner/beg_tree.jpg", "page": TreePosePage()},
  ];

  final List<Map<String, dynamic>> intermediatePoses = [
    {"name": "Warrior III", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Crow Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Eagle Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Camel Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Revolved Triangle", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "King Dancer Pose", "image": "assets/beginner/yoga.jpg", "page": null},
  ];

  final List<Map<String, dynamic>> advancedPoses = [
    {"name": "Headstand", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Peacock Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Scorpions Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Forearm Stand", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Side Crow Pose", "image": "assets/beginner/yoga.jpg", "page": null},
    {"name": "Full Wheel Pose", "image": "assets/beginner/yoga.jpg", "page": null},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff95D5B2),
      appBar: AppBar(
        title: const Text(
          'Choose Difficulty',
          style: TextStyle(
            color: Color(0xFF1B4332),
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff95D5B2),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF1B4332)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildPoseSection("Beginner", beginnerPoses, context),
            buildPoseSection("Intermediate", intermediatePoses, context),
            buildPoseSection("Advanced", advancedPoses, context),
          ],
        ),
      ),
    );
  }

  Widget buildPoseSection(String title, List<Map<String, dynamic>> poses, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: poses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (poses[index]["page"] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => poses[index]["page"], // Redirects to the specific page
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Page for ${poses[index]["name"]} not available yet!"),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(poses[index]["image"]!),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(8),
                            child: Stack(
                              children: [
                                // Outline (Black text rendered slightly offset in all directions)
                                Text(
                                  poses[index]["name"]!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 2
                                      ..color = Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                // Fill (White text over the black outline)
                                Text(
                                  poses[index]["name"]!,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
