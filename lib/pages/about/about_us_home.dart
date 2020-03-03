import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/blocs/connectivity_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/bottom_navigation_bar.dart';
import 'package:association_raed/components/bottom_navigation_bar_item.dart';
import 'package:association_raed/components/disconnected_error.dart';
import 'package:association_raed/enums/connectivity_state.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'about_us.dart';
import 'events_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 0;
  final children = <Widget>[AboutUsPage(), EventsPage()];

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
        tag: 'aboutPage',
        child: Consumer2<AboutUsBloc, ConnectivityStateBloc>(
          builder: (context, about, connectivity, child) {
            return Scaffold(
              backgroundColor: AppColors.lightGrey,
              body: connectivity.getConnectivityState ==
                      ConnectivityState.offline
                  ? DisconnectedErrorPage(
                      onPressed: () {
                        about.getAboutUsFirebase();
                      },
                    )
                  : Container(
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
                                      text: "About us",
                                      icon: Icons.info_outline,
                                      currentIndex: _currentIndex,
                                      thisIndex: 0,
                                      onPressed: () {
                                        setState(() {
                                          _tabController.animateTo(
                                              _tabController.index - 1);
                                          _currentIndex = _tabController.index;
                                        });
                                      },
                                    ),
                                    BottomNavBarItem(
                                      text: "Events",
                                      icon: FontAwesomeIcons.calendarAlt,
                                      currentIndex: _currentIndex,
                                      thisIndex: 1,
                                      onPressed: () {
                                        setState(() {
                                          _tabController.animateTo(
                                              _tabController.index + 1);
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
