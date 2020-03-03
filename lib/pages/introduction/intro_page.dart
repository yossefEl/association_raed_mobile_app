import 'package:association_raed/pages/account/login_page.dart';
import 'package:association_raed/pages/sub_apps_page.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class IntroPage extends StatefulWidget {

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: Gradients.primaryGradient),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return onboardingWidget();
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35),
                            bottomRight: Radius.circular(35))),
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height - ConfigSize.screenHeight*0.122,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: ConfigSize.screenWidth * 0.49,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Get Started",
                                style:Styles.buttonTextStyle,
                              ),
                              onPressed: () {
                                Navigator.push(context,PageTransition(type:PageTransitionType.fade,curve:Curves.easeIn,duration:Duration(milliseconds: 300),child: RaedMicroAppsPage()));
                              }),
                        ),
                        Container(
                          height: 40,
                          width: 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                        ),
                        Container(
                          height: 60,
                          width: ConfigSize.screenWidth * 0.49,
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Sign in",
                                style: Styles.buttonTextStyle,
                              ),
                              onPressed: () {
                                Navigator.push(context,PageTransition(type:PageTransitionType.fade,curve:Curves.easeIn,duration:Duration(milliseconds: 300),child: LoginPage()));
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: (ConfigSize.screenWidth - 60) / 2,
                bottom: 80,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        indicatorWidget(0, _currentIndex),
                        indicatorWidget(1, _currentIndex),
                        indicatorWidget(2, _currentIndex),
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ));
  }

  Widget onboardingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxWidth: 200),
          child: Image.asset("assets/images/intro_img1.png"),
        ),
        Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.center,
            width: ConfigSize.screenWidth * 0.7,
            child: Text(
              "Title",
              style: Styles.titleTextSyle,
            )),
        Container(
          width: ConfigSize.screenWidth * 0.7,
          child: Text(
            '''short description here
sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero''',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget indicatorWidget(int thisOne, int index) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: thisOne == index ? AppColors.lightPurple : Colors.transparent,
          border: Border.all(color: AppColors.lightPurple, width: 2),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
