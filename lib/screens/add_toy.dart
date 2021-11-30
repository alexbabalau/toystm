import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/custom_app_bar.dart';
import 'package:toystm/shared/elements/custom_text_field.dart';
import 'package:toystm/shared/ui_specs.dart';

class AddToy extends StatefulWidget {
  const AddToy({Key? key}) : super(key: key);

  @override
  _AddToyState createState() => _AddToyState();
}

class _AddToyState extends State<AddToy> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _image;


  var _imagePath = '';

  var _titleController = TextEditingController();
  var _minAgeController = TextEditingController();
  var _maxAgeController = TextEditingController();
  var _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    var _pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(){
      _image = _pickedImage;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //this._setupImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          child: Stack(
            children: [
              BackgroundImage('assets/images/img4.png'),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _image == null
                        ? InkWell(
                            onTap: () {
                              _pickImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Container(
                                    color: AppColors.BRONZE_ORANGE,
                                    child: DottedBorder(
                                        strokeWidth: 2,
                                        color: AppColors.BRONZE_ORANGE,
                                        child:
                                            Center(child: Text('Add a photo')))),
                              ),
                            ),
                        )
                        : Image.file(File(_image!.path),
                            height: 160, width: 160),
                    SizedBox(height: 30),
                    CustomTextField('title', _titleController, false),
                    CustomTextField('minAge', _minAgeController, false),
                    CustomTextField('maxAge', _maxAgeController, false),
                    CustomTextField(
                        'description', _descriptionController, false)
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
