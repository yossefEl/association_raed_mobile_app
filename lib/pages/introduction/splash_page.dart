import 'dart:async';
import 'package:association_raed/pages/sub_apps_page.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=>RaedMicroAppsPage())

      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize.init(context);

    print(ConfigSize.screenHeight);
    print(ConfigSize.screenHeight - 70);
    return Scaffold(
      body: Container(
        color: Color(0xfff8f9fa),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: ConfigSize.screenWidth * 0.2,
                  child: Image.asset("assets/images/lg.png")),
            ],
          ),
        ),
      ),
    );
  }
}
