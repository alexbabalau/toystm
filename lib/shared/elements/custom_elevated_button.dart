import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_specs.dart';

class CustomElevatedButton extends StatelessWidget {
  String text;
  double textSize;
  Color? backgroundColor;
  Color? textColor;
  Function? buttonAction;
  Size? size;
  // double width;
  // double height;

  CustomElevatedButton({
    required this.text,
    this.textSize = 16,
    this.backgroundColor,
    this.textColor,
    this.buttonAction,
    this.size,
    // this.width = 0,
    // this.height = 0,
  }) {
    if (backgroundColor == null) this.backgroundColor = AppColors.BRONZE_ORANGE;
    if (textColor == null) this.textColor = AppColors.CREAM;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color?>(this.backgroundColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size?>(this.size),
        /*(width * height) != 0
            ? MaterialStateProperty.all<Size>(Size(this.width, this.height))
            : null*/
      ),
      child: Text(
        this.text,
        style: TextStyle(color: this.textColor, fontSize: this.textSize),
      ),
      onPressed: this.buttonAction == null
          ? null
          : () {
              this.buttonAction!();
            },
    );
  }
}
