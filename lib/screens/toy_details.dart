import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/horizontal_separation_line.dart';
import 'package:toystm/shared/ui_specs.dart';

class ToyDetails extends StatefulWidget {
  @override
  State<ToyDetails> createState() => _ToyDetailsState();
}

class _ToyDetailsState extends State<ToyDetails> {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  bool _isAddedToFavourites = false;

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
            Container(
              width: double.infinity,
              height: 330,
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                this.toy.image,
              ),
            ),
            HorizontalSeparationBar(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          this.toy.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.DARK,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() =>
                                _isAddedToFavourites = !_isAddedToFavourites);
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: _isAddedToFavourites
                                ? AppColors.WINE_RED
                                : AppColors.DARK,
                          )),
                    ],
                  ),
                  Text(
                    '${this.toy.minAge} - ${this.toy.maxAge}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.DARK,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    this.toy.description,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.DARK,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: BottomButton(
              text: 'want to trade',
              backgroundColor: AppColors.WINE_RED,
            )),
          ],
        ),
      ),
    );
  }
}
