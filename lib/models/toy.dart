class ToyFirestoreModel{
  String image;
  String name;
  String description;
  int minAge;
  int maxAge;
  DateTime dateAdded;

  ToyFirestoreModel({this.image = '', this.name = '', this.description = '', this.minAge = 0, this.maxAge = 99, required this.dateAdded});

  Map<String, dynamic> toJson(){
    return {
      'image': this.image,
      'name': this.name,
      'description': this.description,
      'minAge': this.minAge,
      'maxAge': this.maxAge,
      'dateAdded': this.dateAdded
    };
  }  
}