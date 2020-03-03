import 'dart:async';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/colors.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/radii.dart';
import 'package:flutter/material.dart';

class CustomDialogs {
  static BuildContext context;

  static showErrorDialog(
      {IconData icon,
      String title,
      String description,
      BuildContext context,
      bool canPop = true}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (c) {
          return WillPopScope(
            onWillPop: (){return Future.value(false);},
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
              backgroundColor: Colors.white,
              child: Container(
                height: ConfigSize.screenHeight * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: Colors.greenAccent,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(title,style: Styles.titleTextSyle,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(description,textAlign: TextAlign.center,)),
                    ),
                    canPop
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: FlatButton(
                              child: Text("Okey"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static showUpdateAppDialog(
      {IconData icon,
      String title,
      String description,
      BuildContext context,
      bool canPop = true}) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (c) {
          return WillPopScope(
            onWillPop: (){return Future.value(false);},
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
              backgroundColor: Colors.white,
              child: Container(
                height: ConfigSize.screenHeight * 0.45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        icon,
                        color: AppColors.darkPurple,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(child: Text(title,style: Styles.titleTextSyle,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(child: Text(description,textAlign: TextAlign.center,)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
                                    child: Text("Cancel",style:TextStyle(fontSize: 14)),
                                    onPressed: () {
                                      print('go');
                                    },
                                  ),
                                ),
                                SizedBox(width: 16,),

                                  Expanded(
                                  child: FlatButton(
                                    color: AppColors.darkPurple,
                                    shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
                                    child: Text("Update Now!",style: TextStyle(color: Colors.white,fontSize: 14),),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                        ],
                      ),
                    )
                      
                  ],
                ),
              ),
            ),
          );
        });
  }

  // showSuccessDialog() {
  //   return showDialog(

  //   );
  // }
}
