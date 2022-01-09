import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/screens/register.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  AuthenticationService authenticationService = AuthenticationService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? error = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            BackgroundImage('assets/images/log_in.png'),
            Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 160),
                child: Text(
                  'ToysTM LOGO',
                  style: TextStyle(fontSize: 38, color: AppColors.CREAM),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField('email', emailController, false),
                  CustomTextField('password', passwordController, true),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () async {
                              User? user = await authenticationService
                                  .signInWithEmailAndPassword(
                                      emailController.text,
                                      passwordController.text);
                              if (user == null) {
                                setState(() {
                                  this.error = 'Email or password not correct';
                                });
                              } else
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Home()));
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                    color: AppColors.DARK, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: AppColors.DARK, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    this.error ?? '',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
