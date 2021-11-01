import 'package:flutter/material.dart';
import 'package:toystm/models/notification.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';
import 'package:toystm/widgets/notifications_list.dart';

class NotificationsCenter extends StatefulWidget {
  const NotificationsCenter({Key? key}) : super(key: key);

  @override
  _NotificationsCenterState createState() => _NotificationsCenterState();
}

class _NotificationsCenterState extends State<NotificationsCenter> {
  List<TransactionNotification> notifications = List.generate(
      15,
      (index) => TransactionNotification(
          title: 'Trade Request',
          username: 'dariam',
          date: DateTime.now())).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          BackgroundImage("assets/images/img3.png"),
          NotificationsList(notifications),
        ]),
      ),
    );
  }
}
