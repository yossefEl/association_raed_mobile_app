import 'package:association_raed/blocs/tawjih_news_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/bottom_navigation_bar.dart';
import 'package:association_raed/components/bottom_navigation_bar_item.dart';
import 'package:association_raed/pages/raed_tawjih_app/tawjih_news.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'tawjih_school_categories.dart';

class RaedTawjihHome extends StatefulWidget {
  @override
  _RaedTawjihHomeState createState() => _RaedTawjihHomeState();
}

class _RaedTawjihHomeState extends State<RaedTawjihHome>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  final children = <Widget>[TawjihNewsPage(), SchoolCategoriesPage()];

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: children.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize.init(context);
    return Hero(
        tag: 'raedTawjih',
        child: Consumer<TawjihNewsBloc>(
          builder: (context, tawjihNews, child) {
            return Scaffold(
              backgroundColor: AppColors.lightGrey,
              body: Container(
                child: Stack(
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Positioned(
                        // child: Container(color: AppColors.lightGrey),
                        child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: children)),
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
                    Positioned(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomNavigationBar(
                            bottomNavBarItems: [
                              BottomNavBarItem(
                                text: "Tawjih news",
                                icon: FontAwesomeIcons.newspaper,
                                currentIndex: _currentIndex,
                                thisIndex: 0,
                                onPressed: () {
                                  setState(() {
                                    _tabController
                                        .animateTo(_tabController.index - 1);
                                    _currentIndex = _tabController.index;
                                  });
                                },
                              ),
                              BottomNavBarItem(
                                text: "Docs",
                                icon: FontAwesomeIcons.graduationCap,
                                currentIndex: _currentIndex,
                                thisIndex: 1,
                                onPressed: () {
                                  setState(() {
                                    _tabController
                                        .animateTo(_tabController.index + 1);
                                    _currentIndex = _tabController.index;
                                  });
                                },
                              ),
                              // BottomNavBarItem(
                              //   icon: FontAwesomeIcons.home,
                              //     currentIndex: 1,
                              //   thisIndex: 4,

                              //   onPressed: () {
                              //     print('hellow');
                              //   },
                              // )
                            ],
                          )),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
