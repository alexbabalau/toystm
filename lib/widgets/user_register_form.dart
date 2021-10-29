import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class UserRegisterForm extends StatefulWidget {
  const UserRegisterForm({Key? key}) : super(key: key);

  @override
  _UserRegisterFormState createState() => _UserRegisterFormState();
}

class _UserRegisterFormState extends State<UserRegisterForm> {
  var _lastNameController = TextEditingController();
  var _firstNameController = TextEditingController();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmedPasswordController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

  bool _isPasswordValid = true;
  bool _isUsernameValid = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
              _isUsernameValid
                  ? SizedBox(
                      height: 10,
                    )
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  *Please provide another username.',
                        style: TextStyle(color: AppColors.WINE_RED),
                      ),
                    ),
              CustomTextField('password', _passwordController, true),
              CustomTextField(
                  'password verification', _confirmedPasswordController, true),
              _isPasswordValid
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
              CustomTextField('phone (optional)', _phoneController, false),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 60),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.BRONZE_ORANGE),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    //side: BorderSide(color: AppColors.WINE_RED),
                  ),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(color: AppColors.CREAM, fontSize: 16),
              ),
              onPressed: () {
                setState(() {
                  _isPasswordValid = _validPassword(_passwordController.text,
                      _confirmedPasswordController.text);
                  _isUsernameValid = _validUsername(_usernameController.text);
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  bool _validUsername(String username) {
    //TODO : check that the username isn't already taken
    if (username.isEmpty) return false;
    return true;
  }

  bool _validPassword(String password, String passwordConfimed) {
    if (password != passwordConfimed) return false;
    return true;
  }
}
