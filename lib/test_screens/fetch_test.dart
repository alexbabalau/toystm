import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/firestore.dart';

class FetchTest extends StatefulWidget {
  const FetchTest({Key? key}) : super(key: key);

  @override
  _FetchTestState createState() => _FetchTestState();
}

class _FetchTestState extends State<FetchTest> {
  @override
  Widget build(BuildContext context) {
    FirestoreService service = FirestoreService();
    return FutureBuilder<List<dynamic>>(
        future: service.getFirstPageOfToys(),
        
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('Please wait its loading...'));
          } else {
            if (snapshot.hasError)
              return Center(child: Text('Error: ${snapshot.error}'));
            else {
              if (!snapshot.hasData)
                return Center(child: Text('Data is null'));
              else {
                List<dynamic> data = snapshot.data ?? [];
                return Scaffold(
                    body: Container(
                  height: 600,
                  child: ListView(
                    children: [
                      Text(data[0].toJson().toString())
                    ],
                  ),
                ));
              }
            }
          }
        });
  }
}
