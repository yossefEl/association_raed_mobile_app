import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FicheCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const FicheCard({Key key, this.icon, this.title, this.description}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center( 
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        width: ConfigSize.screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          color: Colors.white,
          boxShadow: [Shadows.cardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
          CachedNetworkImage(
                    imageUrl: icon,
                    height: 100,
                    placeholder: (c, text) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (c, s, o) => Center(
                      child: Icon(Icons.error, color: AppColors.darkPurple),
                    ),
                  ),
            Text(
              title??"Title",
              style: Styles.titleTextSyle,
              textAlign: TextAlign.center,
            ),
            Text(description??"Description",
            textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
