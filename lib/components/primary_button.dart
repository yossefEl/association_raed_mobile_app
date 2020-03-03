import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Icon icon;
  final double height;
  final double width;
  final Color color;
  final Gradient gradient;

  PrimaryButton({this.icon, this.onPressed, this.text, this.height, this.width, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration:  BoxDecoration(
          color:color,
          gradient: gradient,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 36.0), // min sizes for Material buttons
              height: height,
              width: width,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon==null?Container(height:0,width:0):icon,
              SizedBox(width:5),
              Text(
                '$text',
                textAlign: TextAlign.center,
                style: Styles.raisedButtonTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
