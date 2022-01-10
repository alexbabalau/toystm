import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/notification.dart';
import 'package:toystm/shared/ui_specs.dart';

class NotificationsList extends StatelessWidget {
  final List<TransactionNotification> notifications;
  Function? onPressedNotification;

  NotificationsList(this.notifications, {this.onPressedNotification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.builder(
          itemBuilder: (ctx, index) {
            return InkWell(
              onTap: (){
                if(onPressedNotification != null)
                  onPressedNotification!.call(notifications[index]);
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 7),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: AppColors.BRONZE_ORANGE,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          notifications[index].title,
                          style: TextStyle(
                            color: AppColors.CREAM,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                notifications[index].username,
                                style: TextStyle(
                                  color: AppColors.CREAM,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              DateFormat.yMd().format(notifications[index].date),
                              style:
                                  TextStyle(color: AppColors.CREAM, fontSize: 16),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: notifications.length),
    );
  }
}
