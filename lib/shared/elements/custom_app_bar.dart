import 'package:flutter/material.dart';
import 'package:toystm/screens/add_toy.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/screens/notifications-center.dart';
import 'package:toystm/screens/user_profile.dart';
import 'package:toystm/shared/ui_specs.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      //centerTitle: true,
      backgroundColor: AppColors.CREAM,
      foregroundColor: AppColors.DARK,
      leading: InkWell(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotificationsCenter()));
        },
        child: IconButton(
          iconSize: 26,
          icon:
              const Icon(true ? Icons.notifications_none : Icons.arrow_back_ios),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ),
      title: InkWell(onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
      }, child: Text('ToysTM')),
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddToy()));
          },
        ),
        IconButton(
          iconSize: 26,
          icon: const Icon(Icons.account_circle_outlined),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserProfile()));
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
