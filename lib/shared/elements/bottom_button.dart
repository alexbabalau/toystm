import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';

class BottomButton extends StatelessWidget {
  String text;
  Color? backgroundColor;
  Color? textColor;
  Function? buttonAction;
  double side_padding;

  BottomButton({
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.buttonAction,
    this.side_padding = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                width: side_padding,
              ),
              Expanded(
                child: CustomElevatedButton(
                  text: this.text,
                  textSize: 22,
                  textColor: this.textColor,
                  backgroundColor: this.backgroundColor,
                  buttonAction: this.buttonAction,
                ),
              ),
              SizedBox(
                width: side_padding,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(bottom: 25),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           CustomElevatedButton(
//             text: this.text,
//             textSize: 22,
//             size: Size(250, 40),
//             textColor: this.textColor,
//             backgroundColor: this.backgroundColor,
//             buttonAction: this.buttonAction,
//           ),
//         ],
//       ),
//     );
//   }
// }