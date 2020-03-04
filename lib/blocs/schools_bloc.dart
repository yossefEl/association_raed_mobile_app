import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:association_raed/components/error_dialog.dart';
import 'package:association_raed/enums/donwloading_state.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/tawjih/concour_model.dart';
import 'package:association_raed/models/tawjih/school_categorie_model.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/firebase_collection_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart' as pp;

//TODO download the file if deleted

class SchoolsBloc with ChangeNotifier {
  ReceivePort _port = ReceivePort();

  List<DownloadTask> tasks;

  ConcourModel cc;

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
    loadTasks();
    // removeAllTasks();
    getSchoolsData();

    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback);
  }

  loadTasks() async {
    tasks = await FlutterDownloader.loadTasks();
  }

  Future<String> getAppDirectory() async {
    final directory = await pp.getExternalStorageDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  downloadConcoursByURL(
      {String link,
      int indexCat,
      int indexS,
      int indexFN,
      int indexConcour}) async {
    if (indexCat == null ||
        indexS == null ||
        indexFN == null ||
        indexConcour == null) return;

    if (cc != null && cc.getDownloadingState == DownloadingState.dowloading) {
      Future.delayed(Duration.zero, () {
        CustomDialogs.showErrorDialog(
            context: ConfigSize.context,
            canPop: true,
            icon: Icons.cloud_download,
            title: "Please wait!",
            description:
                "Another file is downloading now, Please wait until it's done then try again");
      });
      return;
    }

    cc = _categories[indexCat]
        .getSchools[indexS]
        .getConcours[indexFN]
        .getCoucouratList[indexConcour];

    cc.setDownloadingState = DownloadingState.dowloading;
    notifyListeners();

//this one is for avoiding exceptions occured from an empty link
    if (link == null || link.isEmpty) {
      cc.setDownloadingState = DownloadingState.error;
      notifyListeners();
      return;
    }
    //get the app storage path
    String path = '';
    await getAppDirectory().then((appPath) {
      path = appPath != null
          ? appPath
          : "/data/data/com.association.raed.app.mobile/app_flutter";
    }).catchError((error) {
      cc.setDownloadingState = DownloadingState.error;
      notifyListeners();
      return;
    });

//start downloading

    final taskID = await FlutterDownloader.enqueue(
      url: link,
      savedDir: path,
      showNotification:
          true, // show download progress in status bar (for Android)
    );

    if (taskID.isNotEmpty || taskID != null) {
      cc.setTaskID(taskID: taskID);
      notifyListeners();
    } else {
      {
        cc.setDownloadingState = DownloadingState.error;
        notifyListeners();
      }
    }
  }

  //this opened the downloaded file based o taskId of flutter dowbloader
  openDocument({String taskid}) {
    if (taskid.isEmpty || taskid == null) return;

    FlutterDownloader.open(taskId: taskid);
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      print('UI Isolate Callback: $data');
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      if (cc != null) {
        print("Progress: " + cc.getProgress.toString());
        cc.setDownloadingState = status == DownloadTaskStatus.complete
            ? DownloadingState.done
            : DownloadingState.dowloading;
        cc.setProgress = progress;
        notifyListeners();
      }
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    print(
        'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send.send([id, status, progress]);
  }

  @override
  void dispose() {
    _unbindBackgroundIsolate();
    super.dispose();
  }
}
