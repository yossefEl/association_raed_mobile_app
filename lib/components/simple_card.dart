import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class SubAppCard extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String appName;

  const SubAppCard({Key key, this.onPressed, this.icon, this.appName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: ConfigSize.screenWidth * 0.36,
        height: ConfigSize.screenHeight * 0.2,
        decoration: BoxDecoration(
            borderRadius: Radii.k10pxRadius,
            color: Colors.white,
            boxShadow: [Shadows.cardShadow]),
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
          onPressed: onPressed,
          child: Container(
        width: ConfigSize.screenWidth * 0.36,
        height: ConfigSize.screenHeight * 0.2,
        // decoration: BoxDecoration(borderRadius: Radii.k10pxRadius),
        
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(icon,color: AppColors.darkPurple,),
                SizedBox(height:5),

                Text(appName,style: Styles.subAppsTitleTextSTyle,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
