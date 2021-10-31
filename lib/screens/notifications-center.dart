import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';

class NotificationsCenter extends StatefulWidget {
  const NotificationsCenter({Key? key}) : super(key: key);

  @override
  _NotificationsCenterState createState() => _NotificationsCenterState();
}

class _NotificationsCenterState extends State<NotificationsCenter> {
  List<Map> notifications = [
    {'title': 'Trade request', 'username': 'dariam', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
    {'title': 'Trade response', 'username': 'alexb', 'date': 'xx/xx/20xx'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          BackgroundImage("assets/images/img3.png"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: AppColors.BRONZE_ORANGE,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              notifications[index]['title'],
                              style: TextStyle(
                                color: AppColors.CREAM,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                                notifications[index]['username'],
                                style: TextStyle(
                                  color: AppColors.CREAM,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                notifications[index]['date'],
                                style: TextStyle(
                                    color: AppColors.CREAM, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: notifications.length),
          ),
        ]),
      ),
    );
  }
}
