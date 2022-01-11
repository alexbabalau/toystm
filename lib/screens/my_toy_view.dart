import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/screens/home.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/services/transactions.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/horizontal_separation_line.dart';
import 'package:toystm/shared/ui_specs.dart';

class MyToyView extends StatelessWidget {
  ToyFirestoreModel toy = ToyFirestoreModel(
    image: 'assets/images/IMG_6240.jpg',
    name: 'Barca',
    minAge: 4,
    maxAge: 100,
    description:
        'Barca de jucarie.\nMaterial : plastic. Culoarea barcii este alba.\nMinunata pebtru copii pasionati de barci. Pluteste foarte frumos in cada sau pe mare. Minunata pentru jucariile care vor sa vada apusul.',
    dateAdded: DateTime.now(),
  );

  MyToyView({required this.toy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.CREAM,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 330,
              margin: EdgeInsets.only(top: 10),
              child: Image.network(
                this.toy.image,
              ),
            ),
            HorizontalSepaationBar(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          this.toy.name,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.DARK,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.DARK,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${this.toy.minAge} - ${this.toy.maxAge}',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.DARK,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: 129,
                    child: ListView(
                      children: [
                        Text(
                          this.toy.description,
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.DARK,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BottomButton(
                text: 'delete',
                backgroundColor: AppColors.LIGHT_ORANGE,
                buttonAction: () async{
                  await FirestoreService().deleteToyById(toy.id);
                  await TransactionService().deleteTransactionAndPendingsByToyId(toy.id);
                  await FirestoreService().deleteFavoriteByToyId(toy.id);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
