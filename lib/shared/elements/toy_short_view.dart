import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';

import '../ui_specs.dart';

class ToyShortView extends StatelessWidget {
  ToyShortView();
  //ToyShortView(ToyFirestoreModel toy);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 130,
          //margin: EdgeInsets.only(top: 10),
          child: Image.asset('assets/images/IMG_7805.jpg'),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          "ce o fi",
          style: TextStyle(
            fontSize: 14,
            //fontWeight: FontWeight.bold,
            color: AppColors.DARK,
          ),
        ),
      ],
    );
  }
}
