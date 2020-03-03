import 'package:association_raed/blocs/tawjih_news_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/page_not_found_error.dart';
import 'package:association_raed/components/post_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/pages/raed_tawjih_app/single_news_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TawjihNewsPage extends StatefulWidget {
  @override
  _TawjihNewsPageState createState() => _TawjihNewsPageState();
}

class _TawjihNewsPageState extends State<TawjihNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TawjihNewsBloc>(builder: (context, tawjihNews, child) {
      print(tawjihNews.getTawjihNews.length);
      return tawjihNews.getLoadingState == LoadingState.loading
          ? Center(child: CircularProgressIndicator())
          : tawjihNews.getLoadingState == LoadingState.done
              ? Stack(
                  children: <Widget>[
                    Positioned(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.only(top: 70, bottom: 70),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: tawjihNews.getTawjihNews.length ?? 0,
                            itemBuilder: (context, i) => PostCard(
                              image: tawjihNews.getTawjihNews[i].getNewsImages
                                          .length !=
                                      0
                                  ? tawjihNews.getTawjihNews[i].getNewsImages[0]
                                  : null,
                              title: tawjihNews.getTawjihNews[i].getNewsTitle,
                              description:
                                  tawjihNews.getTawjihNews[i].getNewsText,
                              postDate: "23 October",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        curve: Curves.easeIn,
                                        duration: Duration(milliseconds: 300),
                                        child: i <
                                                tawjihNews.getTawjihNews?.length
                                            ? SingleTawjihNewsPage(id: i)
                                            : Scaffold(
                                                body: NotFoundErrorPage(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              )));
                              },
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
                )
              : UnknownErrorPage(
                  onPressed: () {
                    tawjihNews.getTawjihNewsFromFirebase();
                  },
                );
    });
  }
}
