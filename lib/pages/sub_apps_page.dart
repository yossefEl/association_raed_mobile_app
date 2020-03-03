import 'package:association_raed/components/error_dialog.dart';
import 'package:association_raed/components/simple_card.dart';
import 'package:association_raed/pages/about/about_us_home.dart';
import 'package:association_raed/pages/blog/blog_page.dart';
import 'package:association_raed/pages/kari_app/kari_app.dart';
import 'package:association_raed/pages/raed_tawjih_app/tawjih_home.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/firebase_collection_refs.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info/package_info.dart';

class RaedMicroAppsPage extends StatefulWidget {
  @override
  _RaedMicroAppsPageState createState() => _RaedMicroAppsPageState();
}

class _RaedMicroAppsPageState extends State<RaedMicroAppsPage> {
  @override
  void initState() {
    super.initState();

    String currentVersion;
    PackageInfo.fromPlatform().then((infos) {
      currentVersion = infos.version;
      print("version number of this app is: "+currentVersion);
    });

    RaedDatabaseCollections.updatesRefrence.getDocuments().then((result) {
      String newVersion = result.documents[0].data['new_version'];
      if (newVersion != null && newVersion != currentVersion) {
        CustomDialogs.showUpdateAppDialog(
          canPop: false,
          context: ConfigSize.context,
            description:
                "New update is available! so new features are waiting for you :P",
            icon: FontAwesomeIcons.googlePlay,
            title: "New Update!");
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.center,
                height: ConfigSize.screenHeight * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: Gradients.primaryGradient,
                    borderRadius: Radii.subAppsContainerRadius),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical:64),
                  physics: BouncingScrollPhysics(),
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'aboutPage',
                          child: SubAppCard(
                            appName: "about us",
                            icon: FontAwesomeIcons.infoCircle,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => HomePage()));
                            },
                          ),
                        ),
                        Hero(
                          tag: "blogpage",
                          child: SubAppCard(
                            appName: "Blog",
                            icon: FontAwesomeIcons.blog,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => BlogPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'raedTawjih',
                          child: SubAppCard(
                            appName: "Raed Tawjih",
                            icon: FontAwesomeIcons.directions,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => RaedTawjihHome()));
                            },
                          ),
                        ),
                        Hero(
                          tag: "Raed Kari",
                          child: SubAppCard(
                            appName: "Raed Kari",
                            icon: FontAwesomeIcons.solidBuilding,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (c) => KariAppHome()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.only(top: ConfigSize.screenHeight * 0.150),
                    child: Image.asset(
                      "assets/images/lg.png",
                      height: ConfigSize.screenHeight * 0.095,
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(16),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Container(
                  //         width: ConfigSize.screenWidth * 0.7,
                  //         padding: EdgeInsets.only(right: 16),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: <Widget>[
                  //             Text(
                  //               "Hi Maria",
                  //               style: titleTextSyle,
                  //             ),
                  //             Text(
                  //               "We are happy that you come back",
                  //               style: subTitleTextSTyle,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         width: ConfigSize.screenWidth * 0.3 - 48,
                  //         child: ClipRRect(
                  //           borderRadius: Radii.profileImageRadius,
                  //           child: Container(
                  //             width: ConfigSize.screenWidth * 0.2,
                  //             height: ConfigSize.screenWidth * 0.2,
                  //             decoration: BoxDecoration(
                  //               borderRadius: Radii.profileImageRadius,
                  //               color: Colors.amber,
                  //             ),
                  //             child: Image.asset(
                  //               "assets/images/39236784.png",
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
