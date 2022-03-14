import 'package:flutter/material.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/AllProjects/all_projects.dart';
import 'package:get/route_manager.dart';

import '../../../constants.dart';
import 'project_card.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({
    Key? key,
    required this.projectList,
  }) : super(key: key);
  final List<Project> projectList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: ProjectsGridView(
            projectList: projectList,
            crossAxisCount: 1,
            childAspectRatio: 1.7,
          ),
          mobileLarge:
              ProjectsGridView(projectList: projectList, crossAxisCount: 2),
          tablet:
              ProjectsGridView(projectList: projectList, childAspectRatio: 1.1),
          desktop: ProjectsGridView(projectList: projectList),
        ),
       ],
    );
  }
}

class ProjectsGridView extends StatelessWidget {
  const ProjectsGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1.3,
    required this.projectList,
  }) : super(key: key);
  final int crossAxisCount;
  final double childAspectRatio;
  final List<Project> projectList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: projectList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) => ProjectCard(
        project: projectList[index],
      ),
    );
  }
}
