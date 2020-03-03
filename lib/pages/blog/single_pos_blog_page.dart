import 'package:association_raed/blocs/blog_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/small_card.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class SinglePostPage extends StatefulWidget {
  final int id;

  const SinglePostPage({Key key, this.id}) : super(key: key);

  @override
  _SinglePostPageState createState() => _SinglePostPageState();
}

class _SinglePostPageState extends State<SinglePostPage> {
  final listOfcard = <Widget>[
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BlogBloc>(
      builder: (context, blog, child) {
        return Scaffold(
            body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 70),
                    child: Center(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          Container(
                              padding:
                                  EdgeInsets.only(top: 16, bottom: 8, left: 16),
                              child: Text(
                                  blog.getPosts[widget.id].getPostTitle ??
                                      "Title".toUpperCase(),
                                  style: Styles.titleTextSyle)),
                          Container(
                            width: 400,
                            height: 200,
                            child: Swiper(
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: Radii.k10pxRadius,
                                      boxShadow: [Shadows.cardShadow]),
                                  child: ClipRRect(
                                    borderRadius: Radii.k10pxRadius,
                                    child: CachedNetworkImage(
                                      imageUrl: blog.getPosts[widget.id]
                                          .getPostImages[index],
                                      placeholder: (_, t) => Center(
                                        child: Container(color: Colors.grey),
                                      ),
                                      fit: BoxFit.fill,

                                      //                                     loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                      // if (loadingProgress == null) return child;
                                      //   return Center(
                                      //     child: CircularProgressIndicator(
                                      //     value: loadingProgress.expectedTotalBytes != null ?
                                      //            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                      //            : null,
                                      // //     ),
                                      //   );
                                      // },
                                      errorWidget: (_, text, object) =>
                                          Container(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.error,
                                          color: AppColors.lightPurple,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount:
                                  blog.getPosts[widget.id].getPostImages.length,
                              viewportFraction: 0.8,
                              scale: 0.9,
                              autoplay: true,
                              autoplayDelay: 1000,
                              pagination: new SwiperPagination(
                                  margin: new EdgeInsets.all(5.0),
                                  builder: new DotSwiperPaginationBuilder(
                                      color: Colors.grey,
                                      activeColor: AppColors.lightPurple)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16)
                                .add(EdgeInsets.only(bottom: 10)),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                postPublisher(
                                  blog.getPosts[widget.id].getPostAuthor ??
                                      "By Admin",
                                  Icons.edit,
                                ),
                                postPublisher(
                                    blog.getPosts[widget.id]
                                            .getPostCreatedDate ??
                                        "29 Oct",
                                    Icons.date_range),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              blog.getPosts[widget.id].getPostContent,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          // blog.getPosts[widget.id].getRelatedPosts != null
                          //     ? Container(
                          //         padding: EdgeInsets.symmetric(horizontal: 16),
                          //         child: ScrollingCards(
                          //           title: "See also",
                          //           cardsList: listOfcard,
                          //         ),
                          //       )
                          //     : Container(height: 0, width: 0),
                          Container(
                            padding: EdgeInsets.only(bottom: 30),
                          )
                        ],
                      ),
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
          ),
        ));
      },
    );
  }

  Widget postPublisher(String text, IconData icon) {
    return Container(
      width: ConfigSize.screenWidth - 16,
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(icon),
          ),
          Text(
            text,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
