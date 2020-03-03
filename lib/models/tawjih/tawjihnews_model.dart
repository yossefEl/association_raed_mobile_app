import 'package:firebase_database/firebase_database.dart';

class TawjihNewsModel {
  String _newsId;
  String _newsTitle;
  String _newsText;
  String _newsAuthor;
  String _newsCreatedDate;
  List<String> _newsImages=[];
  List<TawjihNewsModel> _relatedNews;
  String get getNewsTitle => _newsTitle;
  String get getNewsText => _newsText;
  String get getNewsAuthor => _newsAuthor;
  String get getNewsCreatedDate => _newsCreatedDate;
  List<String> get getNewsImages => _newsImages;
  List<TawjihNewsModel> get getRelatedNews => _relatedNews;
  String get getNewsId => _newsId;

  TawjihNewsModel.fromSnapshot(DataSnapshot data) {
    print(data);
    _newsId = data.key;
    _newsTitle = data.value['title'];
    _newsText = data.value['text'];
    for (var image in data.value['images']) {
      _newsImages.add(image);
    }
  }
}
