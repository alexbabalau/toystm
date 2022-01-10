import 'package:flutter/material.dart';
import 'package:toystm/screens/favourite_toys.dart';
import 'package:toystm/screens/my_toys.dart';
import 'package:toystm/screens/pendings-list.dart';
import 'package:toystm/shared/elements/custom_elevated_button.dart';
import 'package:toystm/shared/ui_specs.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              text: 'favourites',
              backgroundColor: AppColors.BRONZE_ORANGE,
              buttonAction: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FavouriteToys()));
              },
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              text: 'my toys',
              backgroundColor: AppColors.LIGHT_ORANGE,
              buttonAction: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyToys()));
              },
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              text: 'pending trx',
              backgroundColor: AppColors.ORANGE,
              buttonAction: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PendingsList()));
              },
            ),
          ),
        ),
      ],
    );
  }
}
