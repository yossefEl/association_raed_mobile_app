import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class AppBarCard extends StatelessWidget {
  final Widget title;
  final bool showBackArrow;

  const AppBarCard({Key key, this.title, this.showBackArrow = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        alignment: Alignment.center,
        width: ConfigSize.screenWidth * 0.9,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: Radii.k10pxRadius,
            color: Colors.white,
            boxShadow: [Shadows.appBarShadow]),
        child: Stack(
          children: <Widget>[
            showBackArrow
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )
                : Container(height: 0, width: 0),
            Align(alignment: Alignment.center, child: title),
          ],
        ));
  }
}
