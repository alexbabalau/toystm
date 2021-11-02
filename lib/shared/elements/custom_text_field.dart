import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_specs.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController fieldController;
  final bool isPassword;
  Color? backgroundColor;
  Icon? fieldSuffixIcon;
  //Function? validation;

  CustomTextField(this.label, this.fieldController, this.isPassword,
      {this.backgroundColor, this.fieldSuffixIcon}) {
    if (this.backgroundColor == null) this.backgroundColor = AppColors.CREAM;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.only(left: 30, right: 10),
      child: TextField(
        controller: fieldController,
        obscureText: isPassword,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        decoration: InputDecoration(
          suffixIcon: this.fieldSuffixIcon,
          hintText: label,
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 17),
        ),
        //onSubmitted: () {},
      ),
    );
  }
}
