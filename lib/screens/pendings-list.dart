import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toystm/models/pending_transaction.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/ui_specs.dart';

class PendingsList extends StatelessWidget {
  List<PendingTransaction> pendings = List.generate(
          15,
          (index) =>
              PendingTransaction(username: 'dariam', date: DateTime.now()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          BackgroundImage("assets/images/img4.png"),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    color: AppColors.LIGHT_ORANGE,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  pendings[index].username,
                                  style: TextStyle(
                                    color: AppColors.WINE_RED,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                DateFormat.yMd().format(pendings[index].date),
                                style: TextStyle(
                                    color: AppColors.WINE_RED, fontSize: 16),
                              ),
                            )
                          ],
                        )),
                  );
                },
                itemCount: pendings.length),
          )
        ]),
      ),
    );
  }
}
