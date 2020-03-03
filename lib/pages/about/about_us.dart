import 'package:association_raed/components/about_us_top_navbar.dart';
import 'package:association_raed/pages/about/screens/brief_screen.dart';
import 'package:association_raed/pages/about/screens/fiche_technique_screen.dart';
import 'package:association_raed/pages/about/screens/goals_screen.dart';
import 'package:association_raed/pages/about/screens/organisme_screen.dart';
import 'package:association_raed/pages/about/screens/social_media_screen.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final PageController pageController = PageController(viewportFraction: 1);

  final ScrollController lController = ScrollController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      AboutBriefScreen(),
      FicheTechniqueScreen(),
      SocialMediaStatisticsScreen(),
      GoalsScreen   (),
      OrganismeScreen(),
    ];
    return Stack(alignment: Alignment.topCenter, children: <Widget>[
      Positioned(
        top: 130,
        child: Container(
          height: ConfigSize.screenHeight * 0.69,
          width: ConfigSize.screenWidth,
          child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: pages),
        ),
      ),
      Positioned(
        top: 80,
        left: 16,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 60,
            width: ConfigSize.screenWidth,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                AboutUsTopNavBarItem(
                  onPressed: () {
                    pageController.animateToPage(0,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200));
                    print(pageController.page.toString());
                    setState(() {
                      currentPage = 0;
                    });
                  },
                  title: "Brief",
                  isActive: currentPage == 0 ? true : false,
                ),
                AboutUsTopNavBarItem(
                  onPressed: () {
                    print(pageController.page.toString());

                    pageController.animateToPage(1,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200));
                    setState(() {
                      currentPage = 1;
                    });
                  },
                  title: "Fiche Technique",
                  isActive: currentPage == 1 ? true : false,
                ),
                AboutUsTopNavBarItem(
                  onPressed: () {
                    print(pageController.page.toString());
                    pageController.animateToPage(2,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200));

                    setState(() {
                      currentPage = 2;
                    });
                  },
                  title: "Our social media",
                  isActive: currentPage == 2 ? true : false,
                ),
                AboutUsTopNavBarItem(
                  onPressed: () {
                    pageController.animateToPage(3,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200));
                    setState(() {
                      currentPage = 3;
                    });
                    print(pageController.page.toString());
                  },
                  title: "Our goals",
                  isActive: currentPage == 3 ? true : false,
                ),
                AboutUsTopNavBarItem(
                  onPressed: () {
                    pageController.animateToPage(4,
                        curve: Curves.easeIn,
                        duration: Duration(milliseconds: 200));
                    setState(() {
                      currentPage = 4;
                    });
                  },
                  title: "Organisme",
                  isActive: currentPage == 4 ? true : false,
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

}
