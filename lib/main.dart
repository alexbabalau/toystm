import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/screens/log_in.dart';
import 'package:toystm/screens/my_toy_view.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/pendings-list.dart';
import 'package:toystm/screens/register.dart';
import 'package:toystm/screens/search.dart';
import 'package:toystm/screens/toy_details.dart';
import 'package:toystm/screens/trade_step_3.dart';
import 'package:toystm/screens/user_profile.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TradeStep3(),
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
    );
  }
}
