import 'dart:math';
import 'dart:ui';

import 'package:association_raed/models/tawjih/school_model.dart';

class SchoolCategorieModel {
  final Random _random = Random();
  String _categorieID;
  String _categorieNameFr;
  String _categorieNameAr;
  String _categorieImage;
  Color _categorieCardColor;
  List<SchoolModel> _schools=[];
  String get getCategorieID => _categorieID;
  String get getCategorieNameFr => _categorieNameFr;
  String get getCategorieNameAr => _categorieNameAr;
  String get getCategorieImage => _categorieImage;
  List<SchoolModel> get getSchools => _schools??[];
  Color get getCardColor =>  _categorieCardColor??Color(0xffff4403);
  SchoolCategorieModel.fromJson(var jsonData) {
    _categorieImage = jsonData['image'];
    _categorieNameFr = jsonData['cat_name_fr'];
    _categorieNameAr = jsonData['cat_name_ar'];
    _categorieCardColor = Color.fromARGB(_random.nextInt(256),
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));
    for (var school in jsonData['schools']) {
     
      _schools.add(new SchoolModel.fromJson(school));
    }
  }
}
