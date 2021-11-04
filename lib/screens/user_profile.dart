import 'package:flutter/material.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/user_info.dart';

class UserProfile extends StatelessWidget {
  UserFirestoreModel testUser = new UserFirestoreModel(
      userId: '1',
      username: 'dariamuresan',
      firstName: 'Daria',
      lastName: 'Muresan',
      email: 'dariam@yahoo.com',
      phone: '07xx');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 25),
              child: Icon(
                Icons.account_circle,
                size: 200,
                color: AppColors.DARK,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                testUser.username,
                style: TextStyle(
                    color: AppColors.DARK,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            UserInfo(testUser: testUser),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: 1,
              color: AppColors.DARK,
            ),
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomElevatedButton(
                      text: 'favourites',
                      backgroundColor: AppColors.BRONZE_ORANGE,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomElevatedButton(
                      text: 'my toys',
                      backgroundColor: AppColors.LIGHT_ORANGE,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CustomElevatedButton(
                      text: 'pending trx',
                      backgroundColor: AppColors.ORANGE,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BottomButton(
                text: 'log out',
                backgroundColor: AppColors.WINE_RED,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
