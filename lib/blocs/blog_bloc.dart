import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/models/blog/blog_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BlogBloc with ChangeNotifier {
  final CollectionReference _postsCollectionReference =
      Firestore.instance.collection('posts');
  List<PostModel> _posts = [];
  bool _isEmpty = false;
  LoadingState _loadingState;

  List<PostModel> get getPosts => _posts;
  bool get isEmpty => _isEmpty;
  LoadingState get getLoadingState => _loadingState;

  set setIsEmpty(bool empty) {
    _isEmpty = empty;
    notifyListeners();
  }

  set setLoadingState(LoadingState _state) {
    _loadingState = _state;
    notifyListeners();
  }

  getPostsFirebase() async {
    setLoadingState = LoadingState.loading;
    await _postsCollectionReference.getDocuments().then((result) {
      final data = result.documents;
      print("hello");

      if (data == null)  {setIsEmpty = true;setLoadingState = LoadingState.done;}
    
        

        data.map((post) {
          print(post.data['title']);

          _posts.add(
            PostModel(
                postAuthor: post.data['author'],
                postCreatedDate: post.data['publishedAt'].toString(),
                postTitle: post.data['title'],
                postContent: post.data['content'],
                postImages: post.data['images']),
          );
          print(post.data['images'][0]);
          notifyListeners();
        }).toList();
        setLoadingState = LoadingState.done;
    
    }).catchError((error) {
      print(error.toString());
      setLoadingState = LoadingState.error;
    });
  }

  updtaePosts() {}
  BlogBloc() {
    getPostsFirebase();
  }
}
