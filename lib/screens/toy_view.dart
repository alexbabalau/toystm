import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';

class ToyView extends StatefulWidget {
  ToyFirestoreModel toy;

  ToyView({required this.toy});

  @override
  _ToyViewState createState() => _ToyViewState();
}

class _ToyViewState extends State<ToyView> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.WHITE,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: Center(
                child: FittedBox(
                  child: Image.network(this.widget.toy.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.DARK,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    this.widget.toy.name,
                    style: TextStyle(
                        fontSize: AppFontSizes.L, fontWeight: FontWeight.bold),
                  ),
                ),
                Icon(Icons.favorite)
              ],
            ),
            SizedBox(height: 10),
            Text(
              '${this.widget.toy.minAge} - ${this.widget.toy.maxAge} ani',
              style: TextStyle(
                fontSize: AppFontSizes.M,
              ),
            ),
            Text(
              '${this.widget.toy.description}',
              style: TextStyle(
                fontSize: AppFontSizes.M,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BottomButton(
                  text: 'Want to trade',
                  backgroundColor: AppColors.WINE_RED,
                  textColor: AppColors.WHITE,
                  buttonAction: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
