import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/list_item.dart';

class ToysGridView extends StatelessWidget {
  final List<Map> items;

  ToysGridView(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: MediaQuery.of(context).size.height -
          CustomAppBar().preferredSize.height,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 0),
          itemCount: items.length,
          itemBuilder: (BuildContext ctx, index) {
            return ListItem(items[index]);
          }),
    );
  }
}
