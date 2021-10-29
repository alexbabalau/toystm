import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  Map item;

  ListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            width: 170,
            height: 170,
            child: Image.asset(
              'assets/images/IMG_7805.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(
              item["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Text('age min - age max'),
        ],
      ),
    );
  }
}
