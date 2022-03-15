import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_profile/models/Project.dart';
import 'package:flutter_profile/routes/routes.dart';
import 'package:flutter_profile/screens/404/page_not_found.dart';
import 'package:flutter_profile/screens/AllProjects/all_projects.dart';
import 'package:flutter_profile/screens/Dashboard/Page/SetExp/set_exp.dart';
import 'package:flutter_profile/screens/Dashboard/dashboard.dart';
import 'package:flutter_profile/screens/DashboardAth/dashboardAuth.dart';
import 'package:flutter_profile/screens/home/home_screen.dart';
import 'package:flutter_profile/screens/projectDetail/project_detail.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Project? project;

  const MyApp({Key? key, this.project}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: SetExp(),
      initialRoute: RootRoute,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const PageNotFound(),
        );
      },
      
      routes: <String, WidgetBuilder>{
        RootRoute: (BuildContext) => HomeScreen(),
        AllProjectsPageRoute: (BuildContext) => AllProjects(),
        ProjectDetailPageRoute: (BuildContext) =>
            ProjectDetailPage(project: project!),
        dashboardAth : (BuildContext)=> DashboardAuth(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Nabeel Khanjee',
      // we are using dark theme and we modify it as our need
      theme: ThemeData.dark(
 
       

      ).copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),

          },
        ),
        primaryColorDark: primaryColor,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: TextStyle(color: bodyTextColor),
              bodyText2: TextStyle(color: bodyTextColor),
            ),
      ),
    );
  }
}
