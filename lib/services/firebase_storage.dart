import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{
  Future<String> uploadImageToFirestore(File image, String toyId) async{
    print('upload');
    String fileName = image.path;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('toys/$toyId');
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }
}