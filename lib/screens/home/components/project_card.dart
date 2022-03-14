import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/projectDetail/project_detail.dart';
import 'package:get/route_manager.dart';

import '../../../constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: primaryColor.withOpacity(.1),
          blurRadius: 5,
          offset: Offset(0,5),

        )],
        color: secondaryColor
      ),
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            flex: 4,
            child: Image(image: NetworkImage(project.images[0]))),
                    Spacer(),

          SingleChildScrollView(
            child: Text(
              
              project.title!,
              style: Theme.of(context).textTheme.subtitle2,
            maxLines: 1,
            ),
          ),
          // Spacer(),
          // SingleChildScrollView(
          //   child: Text(
          //     project.description!,
          //     maxLines: Responsive.isMobileLarge(context) ? 3 : 4,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(height: 1.5),
          //   ),
          // ),
          TextButton(
            onPressed: () {
              Get.to(ProjectDetailPage(project: project));
            },
            child: Text(
              "Read More >>",
              style: TextStyle(color: primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
