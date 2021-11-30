import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';

class TradeStep1 extends StatelessWidget {
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
            BackgroundImage("assets/images/img5.png"),
            Column(
              children: [
                Container(
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select a toy",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: AppColors.DARK,
                        ),
                      ),
                    ],
                  ),
                ),
                ToysFirestoreRenderer(
                  subtractedHeight: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
