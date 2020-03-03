import 'dart:async';
import 'dart:io' as io;

import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/tawjih/school_categorie_model.dart';
import 'package:association_raed/utils/firebase_collection_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class SchoolsBloc with ChangeNotifier {
  List<SchoolCategorieModel> _categories = [];
  List<SchoolCategorieModel> get getCategories => _categories ?? [];
  addCargorie(var categorieData) {
    // print(categorieData);
    _categories.add(SchoolCategorieModel.fromJson(categorieData));
    notifyListeners();
    // print(_categories.length);
  }

  LoadingState _loadingState;
  LoadingState get getLoadingState => _loadingState;
  set setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  getSchoolsData() async {
    setLoadingState = LoadingState.loading;
    await RaedDatabaseCollections.tawjihRefrence.getDocuments().then((result) {
      // print(result.documents[0].data);
      result.documents[0].data?.forEach((k, v) {
        // print(v.toString());
        if (v.isNotEmpty) addCargorie(v);
      });
      setLoadingState = LoadingState.done;
    }).catchError((error) {
      setLoadingState = LoadingState.error;
      print(error.toString());
    });
  }

  SchoolsBloc() {
    getSchoolsData();
  }


getAppDirectory() async {
  final directory = await getApplicationDocumentsDirectory();
  // For your reference print the AppDoc directory 
  print(directory.path);
 return directory.path;
}

  downloadConcoursByURL(String link) async {
//this one is for avoiding exceptions occured from an empty link
    if (link == null || link.isEmpty) return;

    //initialize the flutter downloader plugin
    WidgetsFlutterBinding.ensureInitialized();
    await FlutterDownloader.initialize();

//get the app storage path
print(getAppDirectory());
 

//start downloading 

    // final taskId = await FlutterDownloader.enqueue(
    //   url: link,
    //   savedDir: 'the path of directory where you want to save downloaded files',
    //   showNotification:
    //       true, // show download progress in status bar (for Android)
    //   openFileFromNotification:
    //       true, // click on notification to open downloaded file (for Android)
    // );
  }
}
