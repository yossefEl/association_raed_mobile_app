import 'package:association_raed/models/tawjih/concourat_model.dart';

class SchoolModel {
  String _id;
  String _about;
  String _abr;
  String _adress;
  String _city;
  String _nameAr;
  String _nameFr;
  String _sector;
  String _tel;
  String _website;
  List<String> _images = [];
  List<ConcouratModel> _concours = [];
  String get getID => _id;
  String get getAbout => _about;
  String get getAbr => _abr;
  String get getAdress => _adress;
  String get getCity => _city;
  String get getNameAr => _nameAr;
  String get getNameFr => _nameFr;
  String get getSector => _sector;
  String get getTel => _tel;
  String get getWebsite => _website;
  List<String> get getImages => _images;
  List<ConcouratModel> get getConcours => _concours ?? [];

  SchoolModel.fromJson(var school) {
    _about = school['about'];
    _abr = school['abr'];
    _adress = school['adr'];
    _city = school['city'];
    _nameAr = school['name_ar'];
    _nameFr = school['name_fr'];
    _sector = school['sector'];
    _tel = school['tel'];
    _website = school['website'];

    for (var filiere in school['concours']) {
      print(filiere);
      _concours.add(ConcouratModel.fromJson(filiere));
    }
    if (school.containsKey('images'))
      for (var image in school['images']) _images.add(image);
  }
}
