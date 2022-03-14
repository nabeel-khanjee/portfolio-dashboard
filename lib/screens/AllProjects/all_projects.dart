  import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
  import 'package:flutter_profile/models/Project.dart';
  import 'package:flutter_profile/screens/home/components/my_projects.dart';

  class AllProjects extends StatelessWidget {
    const AllProjects({Key? key, this.Project}) : super(key: key);
    final Project;
    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
        
          appBar: AppBar(
            backgroundColor: darkColor,
            title: Text(
              "Projects",
            ),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: primaryColor,
              tabs: [
                Tab(
                  child: Text("Mobile"),
                ),
                Tab(
                  child: Text("Web"),
                ),
                Tab(
                  child: Text("Hybrid"),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(
              children: [
                
                Tab(
                  child: SingleChildScrollView(
                    child: MyProjects(
                      projectList: mobile_projects,
                    ),
                  ),
                ),
                Tab(
                  child: SingleChildScrollView(
                    child: MyProjects(
                      projectList: web_project,
                    ),
                  ),
                ),
                Tab(
                  child: SingleChildScrollView(
                    child: MyProjects(
                      projectList: hybrid_projects,
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
