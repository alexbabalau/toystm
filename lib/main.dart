import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/screens/log_in.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/register.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid_view.dart';
import 'package:toystm/test_screens/fetch_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ToysTMApp());
}

class ToysTMApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
      home:
          //NotificationsCenter(),
          //Register(),
          //LogIn(),
          Home(myProducts),
    );
  }
}
