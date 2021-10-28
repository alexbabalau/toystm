import 'package:flutter/material.dart';
import 'package:toystm/shared/background_image.dart';
import 'package:toystm/shared/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid_view.dart';

class Home extends StatelessWidget {
  List<Map> myProducts;

  Home(this.myProducts);

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
              Stack(children: [
                BackgroundImage("assets/images/home-screen.png"),
                /*Center(
                  child: IconButton(
                    onPressed: () => print('inca nimic'),
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),*/
              ]),
              ToysGridView(myProducts),
            ],
          ),
        ),
      ),
    );
  }
}
