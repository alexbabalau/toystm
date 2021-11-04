import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class AddAToy extends StatefulWidget {
  const AddAToy({Key? key}) : super(key: key);

  @override
  _AddAToyState createState() => _AddAToyState();
}

class _AddAToyState extends State<AddAToy> {
  TextEditingController _title = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WINE_RED,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          //BackgroundImage("assets/images/img4.png"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                CustomTextField(
                  'add a photo :O',
                  _title,
                  false,
                ),
                CustomTextField('Title', _title, false),
                CustomTextField('min. age', _title, false),
                CustomTextField('max. age', _title, false),
                CustomTextField('description', _title, false),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 35),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(Size(220, 40)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.BRONZE_ORANGE),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'save',
                  style: TextStyle(color: AppColors.CREAM, fontSize: 24),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
