import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class Home extends StatelessWidget {
  
  Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BackgroundImage("assets/images/home-screen.png"),
              ToysFirestoreRenderer(),
            ],
          ),
        ),
      ),
    );
  }
}
