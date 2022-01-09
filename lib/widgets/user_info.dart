import 'package:flutter/material.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/shared/ui_specs.dart';

class UserFirestoreModelInfo extends StatelessWidget {
  const UserFirestoreModelInfo({
    Key? key,
    required this.testUser,
  }) : super(key: key);

  final UserFirestoreModel testUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  testUser.firstName,
                  style: TextStyle(
                    color: AppColors.DARK,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  testUser.lastName,
                  style: TextStyle(
                    color: AppColors.DARK,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  testUser.email,
                  style: TextStyle(
                    color: AppColors.DARK,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Text(
                  testUser.phone,
                  style: TextStyle(
                    color: AppColors.DARK,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'edit',
              style: TextStyle(color: AppColors.WINE_RED),
            ),
          ),
        ],
      ),
    );
  }
}
