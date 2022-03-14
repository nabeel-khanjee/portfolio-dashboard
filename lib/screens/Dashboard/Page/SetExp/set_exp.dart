import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/main/components/side_menu.dart';

class SetExp extends StatelessWidget {
  const SetExp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('serexp')),
      body: Row(children: [
        Expanded(flex: 2, child: SideMenu()),
        Expanded(
          flex: 8,
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
                      final docs = snapshot.data!.docs;
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 400, mainAxisExtent: 200),
                          itemCount: docs.length,
                          itemBuilder: (BuildContext context, index) {
                            final Map<String, dynamic> data =
                                docs[index].data() as Map<String, dynamic>;
                            return Card(
                              child: Container(
                                padding: EdgeInsets.all(defaultPadding),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text(data['jobtitle'],style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),),
                                  Text(data['organization']),
                                  SizedBox(height: defaultPadding,),
                                  Text(data['duration']),
                                  Spacer(),
                                  Text(data['description']),
                                  
                                ]),
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
