import 'package:association_raed/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Function onPressed;

  const CustomBackButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.darkPurple),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.lightGrey,
        ),
      ),
      onPressed:onPressed,
    );
  }
}
