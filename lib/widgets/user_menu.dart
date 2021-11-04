import 'package:flutter/material.dart';
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
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              text: 'my toys',
              backgroundColor: AppColors.LIGHT_ORANGE,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CustomElevatedButton(
              text: 'pending trx',
              backgroundColor: AppColors.ORANGE,
            ),
          ),
        ),
      ],
    );
  }
}
