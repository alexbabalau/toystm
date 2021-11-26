import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeStep3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.check_circle,
                      color: AppColors.WINE_RED,
                      size: 140,
                    ),
                  ),
                  Text(
                    "Trade request sent successfuly!",
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: AppColors.DARK,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(
                text: 'pending requests',
                backgroundColor: AppColors.WINE_RED,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
