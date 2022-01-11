import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/screens/my_toy_view.dart';
import 'package:toystm/screens/toy_details.dart';
import 'package:toystm/screens/toy_view.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class FavouriteToys extends StatefulWidget {
  //ToyFirestoreModel toy = ToyFirestoreModel(dateAdded: DateTime.now());

  @override
  State<FavouriteToys> createState() => _FavouriteToysState();
}

class _FavouriteToysState extends State<FavouriteToys> {  
  
  late Future<dynamic> _fetchFuture;
  FirestoreService _firestoreService = FirestoreService();
  List<ToyFirestoreModel> toys = [];
  String userId = AuthenticationService().getCurrentUser()!.uid;


  Future<List<ToyFirestoreModel>> _fetchFavourites() async{
    return await this._firestoreService.getFavouritesForUser(userId);
  }

  @override
  void initState(){
    _fetchFuture = this._fetchFavourites();
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
          
          this.toys = snapshot.data; 
          print(this.toys);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.CREAM,
            appBar: CustomAppBar(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: ToysGridView(toys, onPressedToy: (ToyFirestoreModel toy){
                if(toy.userId == userId)
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyToyView(toy: toy)));
                else
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ToyDetails(toyId: toy.id,)));
              },),
            ),
          );
        }
    );
  }
}
