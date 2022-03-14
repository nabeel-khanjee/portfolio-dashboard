import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/models/dashboardButtons.dart';
import 'package:flutter_profile/screens/Dashboard/Page/AddExp/add_exp.dart';
import 'package:flutter_profile/screens/Dashboard/Page/SetExp/set_exp.dart';
import 'package:flutter_profile/screens/main/components/side_menu.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(flex: 2, child: SideMenu()),
            Expanded(
              flex: 8,
              child: Container(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400, mainAxisExtent: 200),
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (buttons[index].type == "addExp") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddExp()));
                                  } else if (buttons[index].type == 'setExp') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SetExp()));
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  child: Center(
                                      child: Text(buttons[index].buttons)),
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 5),
                                            blurRadius: 5,
                                            color: primaryColor)
                                      ]),
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
