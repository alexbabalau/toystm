import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/list_toy_item.dart';

class ToysGridView extends StatelessWidget {
  final List<ToyFirestoreModel> toys;
  double subtractedHeight;

  ToysGridView(this.toys, {this.subtractedHeight = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height -
          CustomAppBar().preferredSize.height -
          this.subtractedHeight,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0),
          itemCount: toys.length,
          itemBuilder: (BuildContext ctx, index) {
            return ListToyItem(toys[index]);
          }),
    );
  }
}
