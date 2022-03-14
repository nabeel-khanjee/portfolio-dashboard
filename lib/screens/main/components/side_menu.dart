import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(
                      title: "Residence",
                      text: "Pakistan",
                    ),
                    AreaInfoText(
                      title: "City",
                      text: "Karachi",
                    ),
                    AreaInfoText(
                      title: "Age",
                      text: "22",
                    ),
                    AreaInfoText(
                      title: "Phone",
                      text: "+92 343 5425744",
                    ),
                    AreaInfoText(
                      title: "Address",
                      text: "377 Qasimababd Liaquatabad",
                    ),
                    AreaInfoText(
                      title: "Email",
                      text: "nabeelshakeel966@gmail.com",
                    ),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              launch("https://www.linkedin.com/in/nabeel-shakeel-07b6381a0/");
                            },
                            icon: Icon(
                              FontAwesomeIcons.linkedinIn,
                           
                              size: 20,
                           
                           color: Colors.grey,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                launch("https://github.com/nabeel-khanjee");
                              },
                              icon: Icon(FontAwesomeIcons.github
                              
                                 ,size: 20,
                           color: Colors.grey,
                              )),
                          IconButton(
                              onPressed: () {
                                launch("https://www.facebook.com/nabeel.shakeel.925");
                              },
                              icon: Icon(FontAwesomeIcons.facebookF
                              
                              ,size: 20,
                           color: Colors.grey,
                           
                              )),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
