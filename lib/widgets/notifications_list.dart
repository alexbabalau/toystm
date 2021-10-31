import 'package:flutter/material.dart';
import 'package:toystm/shared/ui_specs.dart';

class NotificationsList extends StatelessWidget {
  final List<Map> notifications;

  NotificationsList(this.notifications);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
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
                          style:
                              TextStyle(color: AppColors.CREAM, fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: notifications.length),
    );
  }
}
