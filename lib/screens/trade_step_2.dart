import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeStep2 extends StatelessWidget {
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
            BackgroundImage("assets/images/img4.png"),
            Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You want to trade",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.WINE_RED,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                          child: ToyShortView(
                        toy: toy,
                        textColor: AppColors.CREAM,
                      )),
                      Icon(
                        Icons.multiple_stop,
                        size: 50,
                        color: AppColors.DARK,
                      ),
                      Expanded(
                        child: ToyShortView(
                          toy: toy,
                          textColor: AppColors.CREAM,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By clicking NEXT\nthe request will be sent\nto the owner.\nExchange details are\narranged later with\nthe other trader.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          color: AppColors.CREAM,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Do you want to continue?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.WINE_RED,
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: BottomButton(
                //     text: "cancel",
                //     side_padding: 0,
                //   ),
                // ),
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
                                text: "cancel",
                                textSize: 20,
                                backgroundColor: AppColors.LIGHT_ORANGE,
                                textColor: AppColors.WINE_RED,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "NEXT",
                                textSize: 20,
                                backgroundColor: AppColors.LIGHT_ORANGE,
                                textColor: AppColors.WINE_RED,
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
