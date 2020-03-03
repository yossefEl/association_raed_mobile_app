import 'package:association_raed/components/primary_button.dart';
import 'package:association_raed/pages/sub_apps_page.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/gradients.dart';
import 'package:flutter/material.dart';

class KariAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Raed Kari",
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Center(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: ConfigSize.screenWidth*0.7,
                        child: Image.asset("assets/images/coding.png"),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          "We are working hard \nto make this feature ALIVE 😊",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: PrimaryButton(
                          width: ConfigSize.screenWidth*0.5,
                          height: 45,
                        text: "Back Home",
                          gradient: Gradients.primaryGradient,
                          onPressed: (){

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (c)=>RaedMicroAppsPage())
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
