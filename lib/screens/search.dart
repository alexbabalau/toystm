import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/toys_grid/toys_firestore_renderer.dart';
import 'package:toystm/widgets/toys_grid/toys_grid_view.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var _searchController = TextEditingController();
  FocusNode _focus = new FocusNode();
  double gridHeight = 90;

  List<Map> items =
      List.generate(15, (index) => {'id': index, 'name': 'Product $index'})
          .toList();
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (this.gridHeight == 90)
      this.gridHeight = 383;
    else if (this.gridHeight == 383) this.gridHeight = 90;
  }

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
                _searchController,
                false,
                backgroundColor: AppColors.WHITE,
                fieldSuffixIcon: Icon(Icons.search),
                focus: _focus,
              ),
            ),
            ToysFirestoreRenderer(
              subtractedHeight: this.gridHeight,
            ),
          ],
        ),
      ),
    );
  }
}
