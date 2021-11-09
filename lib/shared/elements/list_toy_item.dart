import 'package:flutter/material.dart';
import 'package:toystm/models/toy.dart';

class ListToyItem extends StatelessWidget {
  ToyFirestoreModel toy;

  ListToyItem(this.toy);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 170,
            height: 170,
            child:
                /*Image.asset(
              'assets/images/IMG_7805.jpg',
              fit: BoxFit.cover,
            ),*/
                Image.network(
              toy.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              toy.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text('${toy.minAge} - ${toy.maxAge}'),
        ],
      ),
    );
  }
}
