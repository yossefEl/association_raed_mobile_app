import 'member_model.dart';

class OrganismeModel {
  String _membersDepartmentName;
  List<MemberModel> _members=[];
  String get getMembersDepartmentName => _membersDepartmentName;
  List<MemberModel> get getMembers => _members?? [];
 

  set setMembers(List<MemberModel> members) {
    _members = members;
  }

  OrganismeModel(
  {  String membersDepartmentName,
  List members,}
  ){
    _membersDepartmentName=membersDepartmentName;
   members.map((member){
     _members.add(member);
   }).toList();
  }
}
