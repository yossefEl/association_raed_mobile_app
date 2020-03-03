class EventModel {
  String _eventDetails;
  List<String> _images=[];
  String _eventLocation;
  String _eventTime;
  String _eventDate;
  String _eventTitle;
  String get getEventDetails => _eventDetails;
  List<String> get getImages => _images;
  String get getEventLocation => _eventLocation;
  String get getEventTime => _eventTime;
  String get getEventDate => _eventDate;
  String get getEventTitle => _eventTitle;
  EventModel({
    String eventDetails,
    List images,
    String eventLocation,
    String eventTime,
    String eventDate,
    String eventTitle,
  }) {
    _eventDetails=eventDetails;
    _eventLocation=eventLocation;
    for(String image in images) _images.add(image);
    _eventTime=eventTime;
    _eventDate=eventDate;
    _eventTitle=eventTitle;
  }
}
