// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_profile/constants.dart';
// import 'package:flutter_profile/responsive.dart';
// import 'package:flutter_profile/screens/main/components/side_menu.dart';

// class EditExp extends StatelessWidget {
//   const EditExp({Key? key,required this.dicId}) : super(key: key);
//   final String dicId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Responsive.isDesktop(context)
//           ? null
//           : AppBar(
//               backgroundColor: bgColor,
//               leading: Builder(
//                 builder: (context) => IconButton(
//                   onPressed: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   icon: Icon(Icons.menu),
//                 ),
//               ),
//             ),
//       drawer: SideMenu(),
//       body: Row(children: [
//         if (Responsive.isDesktop(context))
//                 Expanded(
//                   flex: 2,
//                   child: SideMenu(),
//                 ),
//           Expanded(
//             flex: 7,
//             child: Center(
//               child: Container(
//                  padding: EdgeInsets.all(20),
//             width: 600,

//                   child: Column(
//                     children: [

//                     ],
//                   )),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/DashboardAth/dashboardAuth.dart';
import 'package:flutter_profile/screens/main/components/side_menu.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditExp extends StatelessWidget {
  Map<String, dynamic>? dataEditExp;

  EditExp({Key? key, required this.docId,required  this.data}) : super(key: key);
  final String docId;
  final Map<String,dynamic> data;
  TextEditingController editName = TextEditingController();
  TextEditingController editPhone = TextEditingController();
  TextEditingController editOrganization = TextEditingController();
  TextEditingController editAge = TextEditingController();
  TextEditingController editAddress = TextEditingController();
  TextEditingController editPosition = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: scaffoldKey,
        // drawer: Drawer(child: SideMenu()),
        appBar: Responsive.isDesktop(context)
            ? null
            : AppBar(
                actions: [
                  MaterialButton(onPressed: () {
                    print(docId);
                  })
                ],
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
            flex: 7,
            child: Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  width: 600,
                  child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InputFieldApp(
                                    obscureText: false,
                                    labelText: "Designation",
                                    data: data['jobtitle'] ?? "Designation",
                                    errorMsg: 'Please enter your designation',
                                    textEditingController: editName),
                                SizedBox(height: 20),
                                InputFieldApp(
                                  obscureText: false,
                                  labelText: "Organization",
                                  data: data['organization'] ?? "Organization",
                                  errorMsg:
                                      'Please enter your organization name',
                                  textEditingController: editPhone,
                                ),
                                SizedBox(height: 20),
                                InputFieldApp(
                                  obscureText: false,
                                  labelText: "Time Period",
                                  data: data['duration'],
                                  errorMsg: 'please enter time period',
                                  textEditingController: editPosition,
                                ),
                                SizedBox(height: 20),
                                InputFieldApp(
                                  obscureText: false,
                                  labelText: 'Description',
                                  data: data['description'],
                                  errorMsg: 'Plaese enter project description ',
                                  textEditingController: editAge,
                                ),
                                // SizedBox(height: 20),
                                // InputFieldApp(
                                //   obscureText: false,
                                //   labelText: 'Address',
                                //   data: data['address'],
                                //   errorMsg: 'pleae enter address',
                                //   textEditingController: editAddress,
                                // ),
                                // InputFieldApp(data: data['type'],
                                // errorMsg: 'please enter ',
                                // ),
                                SizedBox(height: 20),
                                AppBUtton(
                                  formKey: formKey,
                                  buttonTitle: 'Edit Your Experience',
                                  // borderColor: active,
                                  // buttonColor: active,
                                  // buttonHeight: 50,
                                  // shadowColor: Color.fromARGB(59, 0, 0, 0),
                                  // textColor: Colors.white,
                                  // buttonTitle: 'Edit Profile',
                                  // buttonWidth: MediaQuery.of(context).size.width,
                                  onTap: () {
                                    print(editName.text);
                                    print(editPhone.text);
                                    print(editPosition.text);
                                    print(editAge.text);
                                    print(editAddress.text);
                                    dataEditExp = {
                                      'position': editName.text.isEmpty
                                          ? data['position']
                                          : editName.text,
                                      'organization': editPhone.text.isEmpty
                                          ? data['organization']
                                          : editPhone.text,
                                      'duration': editPosition.text.isEmpty
                                          ? data['duration']
                                          : editPosition.text,
                                      'description': editAge.text.isEmpty
                                          ? data['description']
                                          : editAge.text,
                                      // 'address': editAddress.text.isEmpty
                                      //     ? data['address']
                                      //     : editAddress.text
                                    };
                                    updateItems(dataEditExp!);
                                  },
                                )
                              ],
                              // title: Text(data['name']),
                              // subtitle: Text(data['phone']),
                      //       );
                      //     },
                      //   );
                      // }
                      // return Center(child: CircularProgressIndicator());
                    // },
                  )),
            ),
          ),
        ]));
  }

  void updateItems(Map<String, dynamic> data) {
    FirebaseFirestore.instance.collection('experience').doc(docId).update(data);
    Fluttertoast.showToast(msg: 'Data Update successfully');
  }
}

class ButtonForApp extends StatelessWidget {
  const ButtonForApp({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    required this.textColor,
    required this.shadowColor,
    required this.borderColor,
    required this.buttonColor,
    required this.buttonWidth,
    required this.buttonHeight,
  }) : super(key: key);
  final VoidCallback onTap;
  final String buttonTitle;
  final double buttonWidth;
  final double buttonHeight;
  final Color textColor;
  final Color shadowColor;
  final Color borderColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: buttonHeight,
          width: buttonWidth,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 5,
                  color: shadowColor,
                )
              ]),
          child: Center(
              child: Text(
            buttonTitle,
            style: TextStyle(color: textColor),
          ))),
      onTap: onTap,
    );
  }
}

class InputFieldApp extends StatelessWidget {
  const InputFieldApp({
    Key? key,
    required this.data,
    required this.textEditingController,
    required this.errorMsg,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);
  final TextEditingController textEditingController;
  final String errorMsg;
  final String data;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      // initialValue: data ,

      decoration: InputDecoration(
          hintText: data,
          labelText: labelText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(10),
          )),

      // onChanged: (value) {
      //   editName = value;
      // },
      controller: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return errorMsg;
        }
        return null;
      },
    );
  }
}
