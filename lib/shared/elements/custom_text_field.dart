import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_specs.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController fieldController;
  final bool isPassword;
  //Function? validation;

  CustomTextField(this.label, this.fieldController, this.isPassword);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.5),
      decoration: BoxDecoration(
        color: AppColors.CREAM,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
      child: TextField(
        controller: fieldController,
        obscureText: isPassword,
        autocorrect: !isPassword,
        enableSuggestions: !isPassword,
        decoration: InputDecoration(
          //suffixIcon: Icon(Icons.visibility),
          hintText: label,
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 17),
        ),
        //onSubmitted: () {},
      ),
    );
  }
}
