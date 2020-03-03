import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/about/fichetechnique_model.dart';
import 'package:association_raed/models/about/goals_model.dart';
import 'package:association_raed/models/about/member_model.dart';
import 'package:association_raed/models/about/organisme_model.dart';
import 'package:association_raed/models/about/socialmedia_model.dart';
import 'package:association_raed/utils/firebase_collection_refs.dart';
import 'package:association_raed/utils/firebase_ids.dart';
import 'package:flutter/widgets.dart';

class AboutUsBloc with ChangeNotifier {
  //**********************************//
  //          get brief               //
  //**********************************//
  String _brief = '';
  String get getBrief => _brief;
  set setBrief(String text) {
    _brief = text;
    notifyListeners();
  }

  //**********************************//
  //          get fiche               //
  //**********************************//

  List<FicheTechniqueModel> _ficheTechniqueData = [];
  List<FicheTechniqueModel> get getFicheTechnique => _ficheTechniqueData ?? [];
  addFicheItem(FicheTechniqueModel ficheTechniqueModel) {
    _ficheTechniqueData.add(ficheTechniqueModel);
    notifyListeners();
  }

  //**********************************//
  //    get social media networks     //
  //**********************************//
  List<SocialMediaModel> _socialMediaData = [];
  List<SocialMediaModel> get getSocialMediaData => _socialMediaData ?? [];
  addSocialMediaItem(SocialMediaModel socialMediaModel) {
    _socialMediaData.add(socialMediaModel);
    notifyListeners();
  }

  //**********************************//
  //          get goals               //
  //**********************************//
  List<GoalsModel> _goals = [];
  List<GoalsModel> get getGoals => _goals ?? [];
  addGoal(GoalsModel goal) {
    _goals.add(goal);
    notifyListeners();
  }

  //**********************************//
  //            get team              //
  //**********************************//

  List<OrganismeModel> _organismeData = [];
  List<OrganismeModel> get getOrganismeData => _organismeData ?? [];
  addOrganismeDeparment(OrganismeModel department) {
    _organismeData.add(department);
    notifyListeners();
  }

  //**********************************//
  //            loading state          //
  //**********************************//

  LoadingState _loadingState;
  LoadingState get getLoadingState => _loadingState;
  set setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  //**********************************//
  //            isEmpty               //
  //**********************************//
  bool _isEmpty;
  bool get isEmpty => _isEmpty;
  set setIsEmpty(bool isempty) {
    _isEmpty = isempty;
    notifyListeners();
  }

  // ***********************************************************

  getAboutUsFirebase() async {
    setLoadingState = LoadingState.loading;

    await RaedDatabaseCollections.aboutUSRefrence.getDocuments().then((result) {
      if (result.documents.length == 0 || result.documents == null) {
        setIsEmpty = true;
        return;
      } else
        setIsEmpty = false;
      for (var item in result.documents) {
        // print(item.data.toString());

        if (item.documentID == FirebaseDbIds.brieId) {
          // print(item.data.toString());
          setBrief = item.data['brief'];
        }

        if (item.documentID == FirebaseDbIds.goalsId) {
          for (var goal in item.data['goals']) {
            addGoal(new GoalsModel(
                goal['title'], goal['description'], goal['image']));
          }
        }

        var organisme = item.data['team'];

        if (item.documentID == FirebaseDbIds.teamId) {
          if (organisme.containsKey('presidents')) {
            List<MemberModel> _members = [];

            for (int j = 0; j < organisme['presidents'].length; j++) {
              _members.add(MemberModel(
                memberName: organisme['presidents'][j]['name'],
                description: organisme['presidents'][j]['about'],
                position: organisme['presidents'][j]['position'],
                image: organisme['presidents'][j]['image'],
              ));
            }

            addOrganismeDeparment(new OrganismeModel(
                membersDepartmentName: "Présidents", members: _members));
          }

          if (organisme.containsKey('conseillers')) {
            List<MemberModel> _members = [];
            for (int j = 0; j < organisme['conseillers'].length; j++) {
              _members.add(new MemberModel(
                memberName: organisme['conseillers'][j]['name'],
                description: organisme['conseillers'][j]['about'],
                position: organisme['conseillers'][j]['position'],
                image: organisme['conseillers'][j]['image'],
              ));
            }

            addOrganismeDeparment(new OrganismeModel(
                membersDepartmentName: "Conseillers", members: _members));
          }

          if (organisme.containsKey('secretaires')) {
            List<MemberModel> _members = [];
            for (int j = 0; j < organisme['secretaires'].length; j++) {
              _members.add(MemberModel(
                memberName: organisme['secretaires'][j]['name'],
                description: organisme['secretaires'][j]['about'],
                position: organisme['secretaires'][j]['position'],
                image: organisme['secretaires'][j]['image'],
              ));
            }
            addOrganismeDeparment(new OrganismeModel(
                membersDepartmentName: "Secrétaires", members: _members));
          }

          if (organisme.containsKey('tresories')) {
            List<MemberModel> _members = [];
            for (int j = 0; j < organisme['tresories'].length; j++) {
              _members.add(MemberModel(
                memberName: organisme['tresories'][j]['name'],
                description: organisme['tresories'][j]['about'],
                position: organisme['tresories'][j]['position'],
                image: organisme['tresories'][j]['image'],
              ));
              notifyListeners();
            }
            addOrganismeDeparment(new OrganismeModel(
                membersDepartmentName: "Trésoreries", members: _members));
          }
        }

        if (item.documentID == FirebaseDbIds.ficheId) {
          for (int i = 0; i < item.data['fiche'].length; i++) {
            addFicheItem(new FicheTechniqueModel(
                item.data['fiche'][i]['title'],
                item.data['fiche'][i]['description'],
                item.data['fiche'][i]['image']));
          }
        }

        if (item.documentID == FirebaseDbIds.socialMediaId) {
          for (int i = 0; i < item.data['socialMedia'].length; i++) {
            print(item.data['socialMedia'][i]['socialMediaName']);
            addSocialMediaItem(new SocialMediaModel(
              icon: item.data['socialMedia'][i]['icon'],
              socialName: item.data['socialMedia'][i]['socialMediaName'],
              statistics: item.data['socialMedia'][i]['statistics'],
            ));
          }
        }
      }

      setLoadingState = LoadingState.done;
    }).catchError((error) {
      print(error.toString());
      setLoadingState = LoadingState.error;
    });
  }

  AboutUsBloc() {
    getAboutUsFirebase();
  }
}
