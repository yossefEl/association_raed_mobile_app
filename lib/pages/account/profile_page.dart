
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.02806, 0.84932),
            end: Alignment(0.71859, 1.01069),
            stops: [
              0,
              1,
            ],
            colors: [
              Color.fromARGB(255, 74, 27, 89),
              Color.fromARGB(255, 239, 0, 151),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 18),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 732,
                        decoration: BoxDecoration(
                          color: AppColors.darkPurple,
                          boxShadow: [
                            Shadows.cardShadow,
                          ],
                        ),
                        child: Container(),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 16,
                      right: 15,
                      bottom: 82,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 63,
                            margin: EdgeInsets.only(left: 2),
                            decoration: BoxDecoration(
                              color: AppColors.darkPurple,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(26, 0, 0, 0),
                                  offset: Offset(0, 0),
                                  blurRadius: 4,
                                ),
                              ],
                              borderRadius: Radii.k10pxRadius,
                            ),
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 261,
                              height: 86,
                              margin: EdgeInsets.only(top: 83),
                              child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      width: 86,
                                      height: 86,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(26, 0, 0, 0),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        "assets/images/39236784.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 11,
                                    right: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Youssef ELMOUMEN",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Member since Oct '18",
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: AppColors.darkGrey,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 20,
                                          child: Text(
                                            "Developer & Designer",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: AppColors.darkGrey,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 229,
                              height: 23,
                              margin: EdgeInsets.only(left: 15, top: 54),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 28,
                                      height: 22,
                                      margin: EdgeInsets.only(top: 1),
                                      child: Image.asset(
                                        "assets/images/icon-material-email.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 17),
                                      child: Text(
                                        "Kokor00ot@gmail.com",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 183,
                              height: 25,
                              margin: EdgeInsets.only(left: 17, top: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        "assets/images/icon-material-call.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 18, top: 1),
                                      child: Text(
                                        "+212 639653187",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 127,
                              height: 28,
                              margin: EdgeInsets.only(left: 19, top: 13),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 20,
                                      height: 28,
                                      child: Image.asset(
                                        "assets/images/icon-material-location-on-2.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 21, top: 2),
                                      child: Text(
                                        "FST Settat",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 29,
                            margin: EdgeInsets.only(left: 13, top: 12, right: 46),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 32,
                                    height: 29,
                                    child: Image.asset(
                                      "assets/images/icon-material-domain.png",
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 2),
                                    child: Text(
                                      "Big data: data analysis and BI",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColors.darkGrey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 109,
                              height: 27,
                              margin: EdgeInsets.only(left: 15, top: 11),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      width: 29,
                                      height: 27,
                                      child: Image.asset(
                                        "assets/images/icon-material-work.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 16, top: 1),
                                      child: Text(
                                        "Student",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.darkGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(top: 54, right: 2),
                            decoration: BoxDecoration(
                              gradient: Gradients.primaryGradient,
                              boxShadow: [
                                Shadows.cardShadow,
                              ],
                              borderRadius: Radii.k10pxRadius,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 12, right: 69),
                                  child: Text(
                                    "Edit Profile Informations",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.lightGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 125, 128, 130),
                              boxShadow: [
                                Shadows.cardShadow,
                              ],
                              borderRadius: Radii.k10pxRadius,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 12, right: 138),
                                  child: Text(
                                    "Logout",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.lightGrey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 37,
                      right: 159,
                      child: Text(
                        "Profile",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      top: 540,
                      right: 17,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: Gradients.primaryGradient,
                          boxShadow: [
                            Shadows.cardShadow,
                          ],
                          borderRadius: Radii.k10pxRadius,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12, right: 69),
                              child: Text(
                                "Edit Profile Informations",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 18,
                      right: 17,
                      bottom: 82,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 125, 128, 130),
                          boxShadow: [
                            Shadows.cardShadow,
                          ],
                          borderRadius: Radii.k10pxRadius,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 12, right: 138),
                              child: Text(
                                "Logout",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.lightGrey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 46,
              margin: EdgeInsets.only(left: 32, right: 31, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 76,
                      height: 45,
                      margin: EdgeInsets.only(bottom: 1),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Opacity(
                              opacity: 0.1,
                              child: Container(
                                width: 76,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(22.5)),
                                ),
                                child: Container(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 24,
                            bottom: 10,
                            child: Image.asset(
                              "assets/images/icon-material-home-3.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 77,
                      height: 45,
                      margin: EdgeInsets.only(left: 1, bottom: 1),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              width: 77,
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(Radius.circular(22.5)),
                              ),
                              child: Container(),
                            ),
                          ),
                          Positioned(
                            left: 28,
                            bottom: 10,
                            child: Image.asset(
                              "assets/images/icon-material-person.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 77,
                      height: 46,
                      margin: EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 19,
                            child: Image.asset(
                              "assets/images/icon-material-format-align-left-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 77,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.lightPurple,
                        borderRadius: BorderRadius.all(Radius.circular(23)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 20,
                            height: 23,
                            child: Image.asset(
                              "assets/images/icon-material-event-note.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}