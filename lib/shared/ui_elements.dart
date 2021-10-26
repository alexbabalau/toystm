import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_specs.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      //centerTitle: true,
      backgroundColor: AppColors.CREAM,
      foregroundColor: AppColors.DARK,
      leading: IconButton(
        iconSize: 26,
        icon: const Icon(Icons.arrow_back_ios),
        tooltip: 'Show Snackbar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
      ),
      title: Text('ToysTM LOGO'),
      actions: [
        IconButton(
          iconSize: 26,
          icon: const Icon(Icons.search),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          iconSize: 26,
          icon: const Icon(Icons.add_circle),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          iconSize: 26,
          icon: const Icon(Icons.account_circle_outlined),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize {
    return Size(double.infinity, 65);
  }
}
