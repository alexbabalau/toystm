import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toystm/models/toy.dart';
import 'package:toystm/services/firebase_storage.dart';
import 'package:toystm/services/firestore.dart';
import 'package:toystm/shared/elements/background_image.dart';
import 'package:toystm/shared/elements/bottom_button.dart';
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
  final FirebaseStorageService _firebaseStorageService =
      FirebaseStorageService();
  final FirestoreService _firestoreService = FirestoreService();
  XFile? _image;
  File? _imageFile;

  var _imagePath = '';

  var _titleController = TextEditingController();
  var _minAgeController = TextEditingController();
  var _maxAgeController = TextEditingController();
  var _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    var _pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = _pickedImage;
      print('here');
      _imageFile = File(_image!.path);
    });
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
                              print('Tap');
                              _pickImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Container(
                                  color: AppColors.DARK,
                                  child: DottedBorder(
                                    strokeWidth: 2,
                                    color: AppColors.DARK,
                                    child: Center(
                                      child: Text(
                                        'Add a photo',
                                        style: TextStyle(
                                          color: AppColors.CREAM,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              _pickImage();
                            },
                            child: Image.file(File(_image!.path),
                                height: 160, width: 160),
                          ),
                    SizedBox(height: 30),
                    CustomTextField('title', _titleController, false),
                    CustomTextField('minAge', _minAgeController, false),
                    CustomTextField('maxAge', _maxAgeController, false),
                    CustomTextField(
                        'description', _descriptionController, false),
                    BottomButton(
                      text: 'Add toy',
                      backgroundColor: AppColors.WINE_RED,
                      textColor: AppColors.WHITE,
                      buttonAction: () {
                        ToyFirestoreModel toyFirestoreModel = ToyFirestoreModel(
                            name: _titleController.text,
                            minAge: int.parse(_minAgeController.text),
                            maxAge: int.parse(_maxAgeController.text),
                            description:
                                _descriptionController.text,
                            dateAdded: DateTime.now());
                            _firestoreService.addToy(toyFirestoreModel, _imageFile);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
