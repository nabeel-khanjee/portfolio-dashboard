import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/routes/routes.dart';
import 'package:flutter_profile/screens/AllProjects/all_projects.dart';
import 'package:flutter_profile/screens/main/main_screen.dart';
import 'package:get/get.dart';

import 'components/home_banner.dart';
import 'components/my_projects.dart';
import 'components/experiences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key, 
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        HomeBanner(),
        MyProjects(
          projectList: hybrid_projects,
        ),
            const SizedBox(height: defaultPadding),
            TextButton(
              onPressed: () {
                Get.toNamed(AllProjectsPageRoute);
              },
              child: Text(
                "All Project",
                          style: TextStyle(color: primaryColor),
    
              ),
            ),
          
        Experiences(),
      ],
    );
  }
}
