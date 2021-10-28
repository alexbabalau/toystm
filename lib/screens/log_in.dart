import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toystm/shared/background_image.dart';
import 'package:toystm/shared/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                  CustomTextField('username', usernameController, false),
                  CustomTextField('passwod', passwordController, true),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
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
                            onPressed: () {},
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    color: AppColors.DARK, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
