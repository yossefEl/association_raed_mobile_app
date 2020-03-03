import 'package:association_raed/models/tawjih/concour_model.dart';

class ConcouratModel {
  String _filiereName;
  List<ConcourModel> listCC = [];
  String get getFiliereName => _filiereName;
  List<ConcourModel> get getCoucouratList => listCC ?? [];
  ConcouratModel.fromJson(var json) {
    _filiereName = json['filiere_name'];
    try {
      for(var cc in json['links']) {
        print(cc.toString());
        listCC.add(ConcourModel.formJson(cc));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
