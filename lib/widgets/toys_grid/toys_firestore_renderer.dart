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

  List<ToyFirestoreModel> toys = [];
  List<DocumentSnapshot<Map<String, dynamic>>> toyDocuments = [];

  ScrollController controller = ScrollController();

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
    super.initState();
    this._fetchFirstPage();
    controller.addListener(this._scrollListener);
  }

  void _scrollListener() async {
    print('Here');
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
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
    return ToysGridView(
      toys,
      substractedHeight: this.widget.subtractedHeight,
    );
  }
}
