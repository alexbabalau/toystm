import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _lastNameController = TextEditingController();
  var _firstNameController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _passwordVerificationController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackgroundImage('assets/images/log_in.png'),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    'ToysTM LOGO',
                    style: TextStyle(fontSize: 30, color: AppColors.DARK),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField('first name', _firstNameController, false),
                    CustomTextField('last name', _lastNameController, false),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField('username', _usernameController, false),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextField('password', _passwordController, true),
                    CustomTextField('password verification',
                        _passwordVerificationController, true),
                    _isValid
                        ? SizedBox(
                            height: 10,
                          )
                        : Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '  *Passwords are not the same!',
                              style: TextStyle(color: AppColors.WINE_RED),
                            ),
                          ),
                    CustomTextField('email', _emailController, false),
                    CustomTextField(
                        'phone (optional)', _phoneController, false),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 60),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.BRONZE_ORANGE),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordController.text ==
                                _passwordVerificationController.text
                            ? _isValid = true
                            : _isValid = false;
                      });
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: AppColors.CREAM, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
