import 'dart:async';

import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/tawjih/tawjihnews_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class TawjihNewsBloc with ChangeNotifier {
  LoadingState _loadingState;
  LoadingState get getLoadingState => _loadingState;
  set setLoadingState(LoadingState state) {
    _loadingState = state;
    notifyListeners();
  }

  final newsReference =
      FirebaseDatabase.instance.reference().child('tawjih_news');

  StreamSubscription<Event> _onNewsAddedSubscription;
  StreamSubscription<Event> _onNewsChangedSubscription;

  List<TawjihNewsModel> _tawjihNews = [];
  List<TawjihNewsModel> get getTawjihNews => _tawjihNews.reversed.toList() ?? [];
  addNewsItem(TawjihNewsModel news) {
    _tawjihNews.add(news);
    notifyListeners();
  }

  updateNewsItem(var oldNewsValue, Event event) {
    _tawjihNews[_tawjihNews.indexOf(oldNewsValue)] =
        TawjihNewsModel.fromSnapshot(event.snapshot);
    notifyListeners();
  }

  getTawjihNewsFromFirebase() {
    setLoadingState=LoadingState.loading;
   try {
     _onNewsAddedSubscription = newsReference.onChildAdded.listen(_onNewsAdded);
    _onNewsChangedSubscription =
        newsReference.onChildChanged.listen(_onNewsUpdated);
        setLoadingState=LoadingState.done;
   } catch (e) {
     setLoadingState=LoadingState.error;
     print(e.toString());
   } 
  }

  void _onNewsAdded(Event event) {
    setLoadingState=LoadingState.loading;
    addNewsItem(TawjihNewsModel.fromSnapshot(event.snapshot));
    _tawjihNews.reversed;
    setLoadingState=LoadingState.done;
    notifyListeners();
  }

  void _onNewsUpdated(Event event) {
setLoadingState=LoadingState.loading;
    var oldNewsValue =
        _tawjihNews.singleWhere((news) => news.getNewsId == event.snapshot.key);

    updateNewsItem(oldNewsValue, event);
    setLoadingState=LoadingState.done;
  }

  TawjihNewsBloc() {
    getTawjihNewsFromFirebase();
  }

  
}
