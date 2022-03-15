import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/404-page.png",
                width: 350,
              ),
            ),
              ],
        ),
      ),
    );
 
  }
}