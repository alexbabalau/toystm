import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid_view.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();

  List<Map> items =
      List.generate(15, (index) => {'id': index, 'name': 'Product $index'})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: CustomTextField(
                'search',
                searchController,
                false,
                backgroundColor: AppColors.WHITE,
                fieldSuffixIcon: Icon(Icons.search),
              ),
            ),
            ToysGridView(
              items,
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
