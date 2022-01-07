import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/horizontal_separation_line.dart';
import 'package:toystm/shared/ui_specs.dart';

class ToyDetails extends StatefulWidget {
  String toyId;
  ToyDetails({this.toyId = '6BbhfUVj1ZB4lNIp5iHa'});
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
  FirestoreService _firestoreService = FirestoreService();
  AuthenticationService _authenticationService = AuthenticationService();

  //String toyId = '6BbhfUVj1ZB4lNIp5iHa';
  String userId = 'DoQZ5zGDJAMc1rh6v7UGZd2Jzsn2';
  late Future<dynamic> _fetchFuture;

  Future<dynamic> _fetchToyAndFavourites() async {
    Future<bool> _isAddedToFavouritesFuture =
        this._firestoreService.isFavourite(widget.toyId, this.userId);
    Future<ToyFirestoreModel?> _toyFuture =
        this._firestoreService.getToyById(widget.toyId);
    return await Future.wait([_isAddedToFavouritesFuture, _toyFuture]);
  }

  @override
  void initState() {
    _fetchFuture = _fetchToyAndFavourites();
    super.initState();
  }

  Future<dynamic> _changeFavourite() async{
    this._isAddedToFavourites = !this._isAddedToFavourites;
    await this._firestoreService.toggleFavourite(widget.toyId, userId);
    setState(() => {_fetchFuture = Future.wait([Future.value(this._isAddedToFavourites), Future.value(this.toy)])});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            throw snapshot.error.toString();
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            //context.loaderOverlay.show();
            return Container();
          }
          this._isAddedToFavourites = snapshot.data[0];
          this.toy = snapshot.data[1];
          print(this._isAddedToFavourites);
          print(this.toy.toJson());
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
                    height: 285,
                    margin: EdgeInsets.only(top: 10),
                    child: Image.network(
                      this.toy.image,
                    ),
                  ),
                  HorizontalSepaationBar(),
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
                                  this._changeFavourite();
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
                        Container(
                          height: 129,
                          child: ListView(
                            children: [
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
        });
  }
}
