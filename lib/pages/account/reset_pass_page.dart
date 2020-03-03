import 'package:association_raed/components/back_button.dart';
import 'package:association_raed/components/primary_button.dart';
import 'package:association_raed/pages/account/signup_page.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ResetPassPage extends StatefulWidget {
  @override
  _ResetPassPageState createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(gradient: Gradients.primaryGradient),
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
      
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipRect(
                child: Container(
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
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                width: ConfigSize.screenWidth * 0.90,
                margin: EdgeInsets.only(bottom: 5),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Didn't get the code? ",
                        style: Styles.buttonTextStyle,
                      ),
                      Text(
                        "Send it again",
                        style: Styles.buttonTextStyle.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {
                  Navigator.push(context,PageTransition(type:PageTransitionType.fade,curve:Curves.easeIn,duration:Duration(milliseconds: 300),child:SignupPage()));
                  },
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
                  children: <Widget>[],
                ),
              ),
            ),
          ),
          Positioned(
              child: Align(
            alignment: Alignment.center,
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 50,
                      child: Hero(
                          tag: 'logo',
                          child: Image.asset("assets/images/lg.png"))),
                  SizedBox(height: 10),
                  Container(
                    width: ConfigSize.screenWidth * 0.7,
                    child: TextFormField(
                        cursorColor: AppColors.darkPurple,
                        decoration: Borders.inputBorderDecoration
                            .copyWith(hintText: "Email")),
                  ),
                  SizedBox(height: 10),
                  PrimaryButton(
                      text: "Reset Password",
                      width: ConfigSize.screenWidth * 0.7,
                      gradient: Gradients.primaryGradient,
                      height: 50),
                  SizedBox(height: 15),
                ],
              ),
            ),
          )),

              Positioned(
                top: 15,
                left:10,
            child: CustomBackButton(
              onPressed:()=>Navigator.of(context).pop()
            ),
          ),
        ],
      ),
    ));
  }
}
