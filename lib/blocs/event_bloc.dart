import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/about/event_model.dart';
import 'package:association_raed/utils/firebase_collection_refs.dart';
import 'package:flutter/cupertino.dart';

class EventsBloc with ChangeNotifier {
  List<EventModel> _events = [];
  List<EventModel> get getEvents => _events ?? [];
  addEvent(EventModel event) {
    _events.add(event);
    notifyListeners();
  }


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


  getEventsFromFirebase() async {
    setLoadingState=LoadingState.loading;
    RaedDatabaseCollections.eventRefrence.getDocuments().then((result) {
      print(result.documents.length);
      

      for(var event in result.documents) {
        addEvent(new EventModel(
          eventTitle: event.data['brief']['title'],
          eventDate: event.data['brief']['date'],
          eventDetails: event.data['details'],
          eventLocation: event.data['brief']['location'],
          eventTime: event.data['brief']['time'],
          images: event.data['images'],
        ));
      }
      setLoadingState=LoadingState.done;
    }).catchError((error) {
      print(error.toString());
      setLoadingState=LoadingState.error;
    });
  }

  EventsBloc() {
    getEventsFromFirebase();
  }
}
