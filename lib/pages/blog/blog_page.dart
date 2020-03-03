import 'package:association_raed/blocs/blog_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/post_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/pages/blog/single_pos_blog_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "blogpage",
        child: Consumer<BlogBloc>(
            builder: (context, blog, child) {
              return Scaffold(
                  body: Stack(
                children: <Widget>[
                  Positioned(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: RefreshIndicator(
                          onRefresh: () => blog.getPostsFirebase(),
                        child: Container(
                          padding: EdgeInsets.only(top: 70),
                          child: blog.getLoadingState == LoadingState.loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : blog.getLoadingState == LoadingState.done
                                  ? ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: blog.getPosts != null
                                          ? blog.getPosts.length
                                          : 0,
                                      itemBuilder: (context, i) => PostCard(
                                        image: blog.getPosts[i].getPostImages[0],
                                        title: blog.getPosts[i].getPostTitle,
                                        description: blog.getPosts[i].getPostContent,
                                        postDate: blog.getPosts[i].getPostCreatedDate,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SinglePostPage(id: i)));
                                        },
                                      ),
                                    )
                                  : UnknownErrorPage(onPressed: (){
                                    blog.getPostsFirebase();
                                  },)
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: AppBarCard(
                            showBackArrow: true,
                            title: Image.asset(
                              "assets/images/lg.png",
                              height: 40,
                            ),
                          ))),
                ],
              ));
            },
          )
        );
  }
}
