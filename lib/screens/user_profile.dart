import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toystm/models/user.dart';
import 'package:toystm/services/authentication.dart';
import 'package:toystm/services/user.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/horizontal_separation_line.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/user_info.dart';
import 'package:toystm/widgets/user_menu.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserFirestoreModel testUser = new UserFirestoreModel(
      userId: '1',
      username: 'dariamuresan',
      firstName: 'Daria',
      lastName: 'Muresan',
      email: 'dariam@yahoo.com',
      phone: '07xx');

  User currentUser = AuthenticationService().getCurrentUser()!;

  late Future<UserFirestoreModel> _fetchFuture;

  @override
  initState(){
    this._fetchFuture = UserService().findUserById(currentUser.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _fetchFuture,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            throw snapshot.error.toString();
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            //context.loaderOverlay.show();
            return Container();
          }
          
        return Scaffold(
          backgroundColor: AppColors.CREAM,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 25),
                  child: Icon(
                    Icons.account_circle,
                    size: 200,
                    color: AppColors.DARK,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    testUser.username,
                    style: TextStyle(
                        color: AppColors.DARK,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                UserFirestoreModelInfo(testUser: snapshot.data),
                HorizontalSepaationBar(),
                UserMenu(),
                Expanded(
                  child: BottomButton(
                    text: 'log out',
                    backgroundColor: AppColors.WINE_RED,
                  ),
                ),
              ],
            ),
          ),
        );
        }
      );
  }
}
