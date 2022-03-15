import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/components/input_field_for_app.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/models/Experience.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/DashboardAth/dashboardAuth.dart';
import 'package:flutter_profile/screens/main/components/side_menu.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddExp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController jobTitle = TextEditingController();
  TextEditingController organization = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController duration = TextEditingController();

  AddExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
      drawer: SideMenu(),
      body: Row(children: [
        if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: SideMenu(),
                ),
        Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputFieldApp(
                        controller: jobTitle,
                        hintText: "Enter the job title",
                        icon: Icons.work,
                        errorRes: "Please Enter the job title"),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    InputFieldApp(
                        controller: organization,
                        hintText: "Enter the organization",
                        icon: Icons.work,
                        errorRes: "Please Enter the organization"),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    InputFieldApp(
                        controller: duration,
                        hintText: "Enter the time period of your services",
                        icon: Icons.work,
                        errorRes:
                            "Please Enter the time period of your services"),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    InputFieldApp(
                        controller: description,
                        hintText: "Enter the description of the project",
                        icon: Icons.work,
                        errorRes: "Please Enter the desciption of the project"),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    AppBUtton(
                        buttonTitle: 'Add Your Experience',
                        formKey: _formKey,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            postExpToFirebase();
                          }
                        })
                  ],
                ),
              ),
            ))
      ]),
    );
  }

  Future<void> postExpToFirebase() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Experience experience = Experience();
    experience.jobTitle = jobTitle.text;
    experience.organization = organization.text;
    experience.duration = duration.text;
    experience.description = description.text;
    await firebaseFirestore.collection('experience').add(experience.toMap());
    Fluttertoast.showToast(msg: "Experience Add Successfully");
  }
}
