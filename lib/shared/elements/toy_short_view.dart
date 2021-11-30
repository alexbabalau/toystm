import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';

import '../ui_specs.dart';

class ToyShortView extends StatelessWidget {
  Color? textColor;
  ToyFirestoreModel toy;

  ToyShortView({required ToyFirestoreModel this.toy, Color? this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 130,
          child: Image.asset(this.toy.image),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          this.toy.name,
          style: TextStyle(
            fontSize: 14,
            //fontWeight: FontWeight.bold,
            color: this.textColor != null ? this.textColor : AppColors.DARK,
          ),
        ),
      ],
    );
  }
}
