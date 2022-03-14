import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/components/input_field_for_app.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_profile/screens/Dashboard/dashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardAuth extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  String? errorMassage;

  DashboardAuth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600,
          padding: EdgeInsets.all(defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                InputFieldApp(
                    errorRes: 'please enter your email',
                    controller: emailController,
                    hintText: "Email",
                    icon: Icons.person),
                SizedBox(
                  height: defaultPadding,
                ),
                InputFieldApp(
                    errorRes: "please enter your password",
                    controller: passController,
                    hintText: "Password",
                    icon: Icons.lock),
                SizedBox(
                  height: defaultPadding,
                ),
                AppBUtton(
                  buttonTitle: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        adminLogin(
                            context, emailController.text, passController.text);
                        print(emailController.text);
                        print(passController.text);
                      }
                    },
                    formKey: _formKey)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> adminLogin(
      BuildContext context, String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()))
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMassage = 'Your email address appears to be malformed';
          break;
        case 'wrong-password':
          errorMassage = 'Your password is wrong';
          break;
        case 'user-not-found':
          errorMassage = "User with this email doesn't exist";
          break;
        case 'too-many-requests':
          errorMassage = 'Too many requests';
          break;
        case 'operation-not-allowed':
          errorMassage = 'Signin with email and password is not enabled';
          break;
        default:
          errorMassage = 'An Undefined Error happened';
      }
      Fluttertoast.showToast(msg: errorMassage!);
      print(error.code);
    }
  }
}

class AppBUtton extends StatelessWidget {
  const AppBUtton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.onTap,required  this.buttonTitle,
  })  : _formKey = formKey,
        super(key: key);
  final VoidCallback onTap;
  final GlobalKey<FormState> _formKey;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 600,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: bodyTextColor)),
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(color: bodyTextColor),
        )),
      ),
    );
  }
}
