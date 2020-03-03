import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:association_raed/styles/text_style.dart';

class AboutUsTopNavBarItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isActive;

  const AboutUsTopNavBarItem({Key key, this.title, this.onPressed, this.isActive=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      child: Center(
        child: Ink(
          decoration: BoxDecoration(
            border: isActive?Border.all(

              color: AppColors.white,
              width: 2,
            ):null,
            color: isActive?AppColors.darkPurple:null,
              gradient: !isActive ?Gradients.primaryGradient:null,
              borderRadius: Radii.k10pxRadius,
              boxShadow: [Shadows.buttonShadow]),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title ?? "??", style: Styles.raisedButtonTextStyle),
            ),
          ),
        ),
      ),
    );
  }
}
