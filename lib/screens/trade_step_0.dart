import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';

class TradeStep0 extends StatelessWidget {
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
                        "Cineva wants to trade",
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
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If you accept the request,\nin the next step\nyou can choose\na toy from\n ... cineva...\nin exchange for\nyour toy.",
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
                                text: "reject",
                                textSize: 20,
                                backgroundColor: AppColors.WINE_RED,
                                textColor: AppColors.CREAM,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: CustomElevatedButton(
                                text: "accept",
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
