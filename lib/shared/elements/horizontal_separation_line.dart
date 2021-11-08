import 'package:flutter/material.dart';

import '../ui_specs.dart';

class HorizontalSeparationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 1,
      color: AppColors.DARK,
    );
  }
}
