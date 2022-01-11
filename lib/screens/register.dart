import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/user_register_form.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackgroundImage('assets/images/register.png'),
              Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    'ToysTM',
                    style: TextStyle(fontSize: 30, color: AppColors.CREAM),
                  )),
              UserRegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
