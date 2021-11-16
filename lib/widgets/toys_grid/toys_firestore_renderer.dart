import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class ToysFirestoreRenderer extends StatefulWidget {
  double subtractedHeight;

  ToysFirestoreRenderer({this.subtractedHeight = 0.0});

  @override
  _ToysFirestoreRendererState createState() => _ToysFirestoreRendererState();
}

class _ToysFirestoreRendererState extends State<ToysFirestoreRenderer> {
  FirestoreService _firestoreService = FirestoreService();

  ScrollController controller = ScrollController();

  

  @override
  void initState() {
    super.initState();
    //this._fetchFirstPage();
    //controller.addListener(this._scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    /*return ToysGridView(
      toys,
      controller,
      substractedHeight: this.widget.subtractedHeight,
    );*/
    return Container();
  }
}
