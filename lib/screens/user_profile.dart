import 'package:flutter/material.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/ui_specs.dart';

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
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          testUser.firstName,
                          style: TextStyle(
                            color: AppColors.DARK,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          testUser.lastName,
                          style: TextStyle(
                            color: AppColors.DARK,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          testUser.email,
                          style: TextStyle(
                            color: AppColors.DARK,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          testUser.phone,
                          style: TextStyle(
                            color: AppColors.DARK,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'edit',
                      style: TextStyle(color: AppColors.WINE_RED),
                    ),
                  ),
                ],
              ),
            ),
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
              child: Container(
                padding: EdgeInsets.only(bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      text: 'log out',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
