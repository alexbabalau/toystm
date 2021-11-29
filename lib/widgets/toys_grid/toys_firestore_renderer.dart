import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/constants.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/list_toy_item.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class ToysFirestoreRenderer extends StatefulWidget {
  double subtractedHeight;

  ToysFirestoreRenderer({this.subtractedHeight = 0.0});

  @override
  _ToysFirestoreRendererState createState() => _ToysFirestoreRendererState();
}

class _ToysFirestoreRendererState extends State<ToysFirestoreRenderer> {
  bool _hasMore = false;
  int _pageNumber = 0;
  bool _error = false;
  bool _loading = true;
  final int _defaultPhotosPerPageCount = Constants.NUMBER_OF_TOYS_PER_PAGE;
  List<ToyFirestoreModel> _toys = [];
  List<DocumentSnapshot<Map<String, dynamic>>> _toyDocumentSnapshots = [];
  final int _nextPageThreshold = 0;
  FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();

    //this._fetchFirstPage();
    //controller.addListener(this._scrollListener);
    this._fetchNextPage();
  }

  Future<void> _fetchNextPage() async {
    try {
      if (_pageNumber == 0) {
        List<DocumentSnapshot<Map<String, dynamic>>> _newToyDocumentSnapshots =
            await _firestoreService.getFirstPageOfToys();
        List<ToyFirestoreModel> _newToys = _newToyDocumentSnapshots
            .map((documentSnapshot) =>
                ToyFirestoreModel.fromDocumentSnapshot(documentSnapshot))
            .toList();
        setState(() {
          _toyDocumentSnapshots.addAll(_newToyDocumentSnapshots);
          _toys.addAll(_newToys);
          _pageNumber = _pageNumber + 1;
          _hasMore = _newToys.length == _defaultPhotosPerPageCount;
          _loading = false;
        });
      } else {
        List<DocumentSnapshot<Map<String, dynamic>>> _newToyDocumentSnapshots =
            await _firestoreService
                .getNextPageOfToys(this._toyDocumentSnapshots.last);
        List<ToyFirestoreModel> _newToys = _newToyDocumentSnapshots
            .map((documentSnapshot) =>
                ToyFirestoreModel.fromDocumentSnapshot(documentSnapshot))
            .toList();
        setState(() {
          _toyDocumentSnapshots.addAll(_newToyDocumentSnapshots);
          _toys.addAll(_newToys);
          _pageNumber = _pageNumber + 1;
          _hasMore = _newToys.length == _defaultPhotosPerPageCount;
          _loading = false;
        });
      }
    } catch (e) {
      _error = true;
      _loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_pageNumber);
    print(_hasMore);
    if (_toys.isEmpty) {
      if (_loading) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        if (_error) {
          return Center(
            child: InkWell(
              onTap: () {
                setState(() {
                  _loading = true;
                  _error = false;
                  _fetchNextPage();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error while loading photos, tap to try again"),
              ),
            ),
          );
        }
      }
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: MediaQuery.of(context).size.height -
            CustomAppBar().preferredSize.height -
            this.widget.subtractedHeight,
        child: GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 0),
            itemCount: _toys.length + (_hasMore ? 1 : 0),
            itemBuilder: (BuildContext ctx, index) {
              if (index == _toys.length - _nextPageThreshold && _hasMore) {
                this._fetchNextPage();
              }
              if (index == _toys.length) {
                if (_error) {
                  return Center(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        _loading = true;
                        _error = false;
                        this._fetchNextPage();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                          Text("Error while loading photos, tap to try agin"),
                    ),
                  ));
                } else {
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  ));
                }
              }
              return ListToyItem(_toys[index]);
            }),
      );
    }
    return Container();
  }
}
