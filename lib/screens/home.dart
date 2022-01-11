import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/screens/my_toy_view.dart';
import 'package:toystm/screens/toy_details.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class Home extends StatefulWidget {
  
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userId = AuthenticationService().getCurrentUser()!.uid;

  FirestoreService _firestoreService = FirestoreService();
  ScrollController scrollController = ScrollController();

  List<ToyFirestoreModel> toys = [];
  List<DocumentSnapshot<Map<String, dynamic>>> toyDocuments = [];

  late Future<dynamic> _fetchFuture;

  @override
  void initState(){
    //this.scrollController.addListener(() {this._scrollListener();});
    //this._fetchFirstPage();
    this._fetchFuture = FirestoreService().getToys();
    super.initState();
  }

  void _fetchFirstPage() async {
    var firstToyDocuments = await this._firestoreService.getFirstPageOfToys();
    setState(() {
      this.toyDocuments = firstToyDocuments;
      this.toys = this
        .toyDocuments
        .map((document) => ToyFirestoreModel.fromDocumentSnapshot(document))
        .toList();
    });
    //print(this.toys);
  }

  void _scrollListener() async{
    print('Here');
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print("at the end of list");

      var nextPageOfToyDocuments = await this
          ._firestoreService
          .getNextPageOfToys(this.toyDocuments.last);
      var nextPageOfToys = nextPageOfToyDocuments
          .map((document) => ToyFirestoreModel.fromDocumentSnapshot(document))
          .toList();
      setState(() {
        this.toyDocuments.addAll(nextPageOfToyDocuments);
        this.toys.addAll(nextPageOfToys);
      });
    }
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
            child: SingleChildScrollView(
              //controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  BackgroundImage("assets/images/home-screen.png"),
                  ToysGridView(
                    snapshot.data,
                    onPressedToy: (ToyFirestoreModel toy){
                    if(toy.userId == userId)
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyToyView(toy: toy)));
                    else
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ToyDetails(toyId: toy.id,)));
                  },),
                ],
              ),
            ),
          ),
        );});
  }
}
