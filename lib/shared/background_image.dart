import 'package:flutter/material.dart';
import 'package:toystm/shared/custom_app_bar.dart';

class BackgroundImage extends StatelessWidget {
  String imagePath;

  BackgroundImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -
          CustomAppBar().preferredSize.height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}
