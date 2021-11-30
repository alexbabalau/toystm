import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/screens/add_toy.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/screens/log_in.dart';
import 'package:toystm/screens/my_toy_view.dart';
import 'package:toystm/screens/my_toys.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/pendings-list.dart';
import 'package:toystm/screens/register.dart';
import 'package:toystm/screens/search.dart';
import 'package:toystm/screens/toy_view.dart';
import 'package:toystm/screens/trade_step_1.dart';
import 'package:toystm/screens/user_profile.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';
import 'package:toystm/test_screens/fetch_test.dart';
import 'package:toystm/screens/toy_details.dart';
import 'package:toystm/screens/trade_step_0.dart';
import 'package:toystm/screens/trade_step_2.dart';
import 'package:toystm/screens/trade_step_3.dart';
import 'package:toystm/screens/user_profile.dart';

import 'models/toy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ToysTMApp());
}

class ToysTMApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ToysTMAppState();
  }
}

class _ToysTMAppState extends State<ToysTMApp> {
  List<Map> myProducts =
      List.generate(15, (index) => {'id': index, 'name': 'Product $index'})
          .toList();
  List<ToyFirestoreModel> toys = [];
  List<DocumentSnapshot<Map<String, dynamic>>> toyDocuments = [];
  FirestoreService _firestoreService = FirestoreService();

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

  @override
  void initState() {
    // TODO: implement initState
    this._fetchFirstPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToys(),
      //TradeStep1(),
      //TradeStep0(),
      //TradeStep2(),
      //TradeStep3(),
      //MyToyView(),
      //ToyDetails(),
      //UserProfile(),
      //Search(),
      //NotificationsCenter(),
      //PendingsList(),
      //Register(),
      //LogIn(),
      //Home(),
      //FetchTest()
      //AddToy(),
    );
  }
}
