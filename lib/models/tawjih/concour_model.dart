class ConcourModel {
  String _name;
  String _link;
  String get getDownloadLink => _link;
  String get getFileName => _name;
  ConcourModel.formJson(var cc){
    print(cc);
    _name=cc['name'];
    _link=cc['link'];
  }
}