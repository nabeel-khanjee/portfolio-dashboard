import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/models/Project.dart';

class ProjectDetailPage extends StatelessWidget {
  ProjectDetailPage({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: Text(project.title!),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Center(
          child: 
              GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

                   maxCrossAxisExtent: 300.0,
                   mainAxisExtent: 400,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 4.0,

                ),

                
                itemBuilder: (context, index,) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor),
                      boxShadow: [
                        BoxShadow(
                          color: primaryColor.withOpacity(.1),
                          blurRadius: 5,

                          offset: Offset(0, 5)
                        )
                      ]
                ,    color: secondaryColor,
                    ),
                    child: Image(
                      
                      image: NetworkImage(project.images[index]),
                    ),
                  );
                },
                itemCount: project.images.length,
                // options: CarouselOptions(
                //   autoPlay: true,
                //   enlargeCenterPage: true,
                //   viewportFraction: 0.9,
                //   initialPage: 1,
                // ),
              ),
            
          ),
      ),
      
    );
  }
}
