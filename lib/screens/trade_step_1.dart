import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/models/transaction.dart';
import 'package:toystm/screens/trade_step_2.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/elements/toy_short_view.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class TradeStep1 extends StatefulWidget {
  
  TransactionFirestoreModel transaction;

  TradeStep1({required this.transaction});
  
  @override
  State<TradeStep1> createState() => _TradeStep1State();
}

class _TradeStep1State extends State<TradeStep1> {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_7805.jpg',
    name: 'Pestera',
    minAge: 4,
    maxAge: 100,
    description:
        'Psetera jucarie. Replica Pestera Ungurul Mare, Suncuius, Jud. Bihor. Contine si mini lilieci de jucarie pe tavan.',
    dateAdded: DateTime.now(),
  );

  late Future<dynamic> _fetchFuture;
  
  Future<dynamic> _fetchToys() async{
    return await Future.wait([FirestoreService().getUserToys(widget.transaction.senderUserId), FirestoreService().getToyById(widget.transaction.receiverUserId)]);
  }

  @override
  void initState() {
    // TODO: implement initState
    this._fetchFuture = _fetchToys();
    super.initState();
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
                      ToysGridView(
                        snapshot.data[0],
                        onPressedToy: (ToyFirestoreModel toy) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TradeStep2(transaction: widget.transaction, senderToy: toy, receiverToy: snapshot.data[1],)));
                        },
                        subtractedHeight: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
          }
        );
  }
}
