import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class PendingTradeNotification extends StatelessWidget {
  UserFirestoreModel user = UserFirestoreModel(
    username: "dariam",
    firstName: "Daria",
    lastName: "Muresan",
    email: "muresand@yahoo.com",
  );

  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            //BackgroundImage("assets/images/user_data.png"),
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user.username,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.DARK,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.firstName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.DARK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.lastName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.DARK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.DARK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //TODO create a new component
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: ToyShortView(
                        toy: toy,
                        textColor: AppColors.DARK,
                      )),
                      Icon(
                        Icons.multiple_stop,
                        size: 50,
                        color: AppColors.WINE_RED,
                      ),
                      Expanded(
                        child: ToyShortView(
                          toy: toy,
                          textColor: AppColors.DARK,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "finalized trade",
                                textSize: 20,
                                backgroundColor: AppColors.WINE_RED,
                                textColor: AppColors.CREAM,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
