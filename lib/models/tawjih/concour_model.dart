import 'dart:async';

import 'package:association_raed/enums/donwloading_state.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'dart:io' as io;

class ConcourModel {
  String _name;
  String _link;
  String _taskId;
  int _progress = 0;

  DownloadingState _downloadingState = DownloadingState.none;

  set setDownloadingState(DownloadingState _dState) {
    _downloadingState = _dState;
  }

  set setProgress(int p) {
    _progress = p;
  }

  String get getTaskId => _taskId;
  String get getDownloadLink => _link;
  int get getProgress => _progress;
  String get getFileName => _name;
  DownloadingState get getDownloadingState => _downloadingState;
  ConcourModel.formJson(var cc) {
    print(cc);

    _name = cc['name'];
    _link = cc['link'];
    setTaskID();
  }

  setTaskID({String taskID}) async {
    if (taskID != null) {
      _taskId = taskID;
    }
    final tasks = await FlutterDownloader.loadTasks();
    tasks?.forEach((task) async {
      if (task?.url == _link) {
        _taskId = task.taskId;
        String filePath =
            task.savedDir + io.Platform.pathSeparator + task?.filename;
        bool isFileExists = await io.File(filePath).exists();
        if (task.status == DownloadTaskStatus.complete && isFileExists) {
          _downloadingState = DownloadingState.done;
          _progress = 100;
        } else {
          FlutterDownloader.remove(taskId: task.taskId);
          _taskId='';
          _downloadingState = DownloadingState.none;
          _progress = 0;
        }
      }
    });
  }

  //default constructor for ChangeNotifierProvider init
  ConcourModel();
}
