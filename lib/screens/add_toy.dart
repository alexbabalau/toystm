import 'package:flutter/material.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';

class AddToy extends StatefulWidget {
  const AddToy({ Key? key }) : super(key: key);

  @override
  _AddToyState createState() => _AddToyState();
}

class _AddToyState extends State<AddToy> {

  var _titleController = TextEditingController();
  var _minAgeController = TextEditingController();
  var _maxAgeController = TextEditingController();
  var _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Stack(children: [
          BackgroundImage('assets/images/img4.png'),
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 160),
              CustomTextField('title', _titleController, false),
              CustomTextField('minAge', _minAgeController, false),
              CustomTextField('maxAge', _maxAgeController, false),
              CustomTextField('description', _descriptionController, false)
            ],),
          )
        ],),
      ) 
    );
  }
}