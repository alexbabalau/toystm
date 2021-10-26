import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_elements.dart';
import 'package:toystm/shared/ui_specs.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/home-screen.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: Text('Hello Daria!'),
            ),
          ],
        ),
      ),
    );
  }
}
