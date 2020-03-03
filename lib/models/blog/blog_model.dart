class PostModel {
  String _postTitle;
  List<String> _postImages=[];
  String _postAuthor;
  String _postCreatedDate;
  String _postContent;
  List<PostModel> _relatedPosts;
  String get getPostTitle => _postTitle;
  List<String> get getPostImages => _postImages;
  String get getPostAuthor => _postAuthor;
  String get getPostCreatedDate => _postCreatedDate;
  String get getPostContent => _postContent;
  List<PostModel> get getRelatedPosts => _relatedPosts;
  set setPostTitle(String posttitle) {
    _postTitle = posttitle;
  }

  set setPostImages(List<String> postimages) {
    _postImages = postimages;
  }

  set setPostAuthor(String postauthor) {
    _postAuthor = postauthor;
  }

  set setPostCreatedDate(String postcreateddate) {
    _postCreatedDate = postcreateddate;
  }

  set setPostContent(String postcontent) {
    _postContent = postcontent;
  }

  set setRelatedPosts(List<PostModel> relatedposts) {
    _relatedPosts = relatedposts;
  }

  PostModel({
    String postTitle,
    List postImages,
    String postAuthor,
    String postCreatedDate,
    String postContent,
  }) {
    _postTitle = postTitle;
    for (String image in postImages) {
      {
        _postImages.add(image.toString());
      }
      _postAuthor = postAuthor;
      _postCreatedDate = postCreatedDate;
      _postContent = postContent;
    }
  }
}
