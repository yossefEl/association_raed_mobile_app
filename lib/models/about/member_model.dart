class MemberModel {
  String _memberName;
  String _position;
  String _image;
  String _description;
  String get getMemberName => _memberName;
  String get getPosition => _position;
  String get getImage => _image;
  String get getDescription => _description;

  MemberModel(
      {String memberName, String description, String position, String image}) {
    _memberName = memberName;
    _position = position;
    _image = image;
    _description = description;
  }
}
