class UserModel {
  String _name;
  String _email;
  String _phone;
  String _school;
  String _career;
  String _job;
  String _memberSince;
  String _image;
  String get getName => _name;
  String get getEmail => _email;
  String get getPhone => _phone;
  String get getSchool => _school;
  String get getCareer => _career;
  String get getJob => _job;
  String get getMemberSince => _memberSince;
  String get getImage => _image;
  set setName(String name) {
    _name = name;
  }

  set setEmail(String email) {
    _email = email;
  }

  set setPhone(String phone) {
    _phone = phone;
  }

  set setSchool(String school) {
    _school = school;
  }

  set setCareer(String career) {
    _career = career;
  }

  set setJob(String job) {
    _job = job;
  }

  set setMemberSince(String membersince) {
    _memberSince = membersince;
  }

  set setImage(String image) {
    _image = image;
  }
}
