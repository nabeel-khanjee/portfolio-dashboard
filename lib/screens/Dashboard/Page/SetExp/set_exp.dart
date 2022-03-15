import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/screens/Dashboard/Page/EditExp/edit_exp.dart';
import 'package:flutter_profile/screens/main/components/side_menu.dart';

class SetExp extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  SetExp({Key? key}) : super(key: key);

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
          flex: 7,
          child: Container(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('experience')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return Text('Error = ${snapshot.error}');
                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs.reversed.toList();
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400, mainAxisExtent: 200),
                          itemCount: docs.length,
                          itemBuilder: (BuildContext context, index) {
                            final Map<String, dynamic> data =
                                docs[index].data() as Map<String, dynamic>;
                            return Card(
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(defaultPadding),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['jobtitle'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(data['organization']),
                                          SizedBox(
                                            height: defaultPadding,
                                          ),
                                          Text(data['duration']),
                                          Spacer(),
                                          Text(
                                            data['description'],
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ]),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      EditExp(
                                                        data: data,
                                                          docId: docs[index]
                                                              .id))));
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: primaryColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0, 5),
                                                      blurRadius: 5,
                                                      color: Color.fromARGB(
                                                          115, 0, 0, 0))
                                                ]),
                                            child: Icon(Icons.add)),
                                      )),
                                  Positioned(
                                      top: 0,
                                      right: 50,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: secondaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          border: Border.all(
                                                              color:
                                                                  secondaryColor),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  primaryColor,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(0, 5),
                                                            )
                                                          ]),
                                                      height: 200,
                                                      width: 400,
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Are Your want to delete your expereience',
                                                            ),
                                                            SizedBox(
                                                              height: 25,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                MaterialButton(
                                                                  color:
                                                                      primaryColor,
                                                                  height: 50,
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    // FirebaseFirestore
                                                                    //     .instance
                                                                    //     .collection('experience')
                                                                    //     .doc(docs[index].id)
                                                                    //     .delete()
                                                                    //     .catchError((e) {
                                                                    //   print(
                                                                    //       e);
                                                                    // });
                                                                  },
                                                                  child: Text(
                                                                      "Cancle"),
                                                                ),
                                                                SizedBox(
                                                                    width: 15),
                                                                MaterialButton(
                                                                  color:
                                                                      primaryColor,
                                                                  height: 50,
                                                                  // formKey: formKey,
                                                                  onPressed:
                                                                      () {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'experience')
                                                                        .doc(docs[index]
                                                                            .id)
                                                                        .delete()
                                                                        .catchError(
                                                                            (e) {
                                                                      print(e);
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                      'Delete Experience'),
                                                                ),
                                                              ],
                                                            )
                                                          ]),
                                                    ),
                                                  ));
                                        },
                                        child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                border: Border.all(
                                                    color: primaryColor),
                                                boxShadow: [
                                                  BoxShadow(
                                                      offset: Offset(0, 5),
                                                      blurRadius: 5,
                                                      color: Color.fromARGB(
                                                          115, 0, 0, 0))
                                                ]),
                                            child: Icon(Icons.close)),
                                      ))
                                ],
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  })),
        )
      ]),
    );
  }
}
