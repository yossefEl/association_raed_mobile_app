import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class SchoolCategorieCard extends StatelessWidget {
  final Function onPressed;
  final String categorieName;
  final String categorieNameAr;
  final String categorieImage;
  final Color cardColor;

  SchoolCategorieCard(
      {Key key,
      this.onPressed,
      this.categorieName,
      this.categorieImage,
      this.cardColor,
      this.categorieNameAr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        radius: 10,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      cardColor?.withOpacity(0.5), BlendMode.multiply),
                  image: categorieImage != null
                      ? NetworkImage(categorieImage)
                      : ExactAssetImage("assets/images/marrakech.png")),
              borderRadius: Radii.k10pxRadius,
              color: Colors.white,
              boxShadow: [Shadows.cardShadow]),
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
          child: Container(
            height: 110,
            child: Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          categorieNameAr ?? "المدراس العليا",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          categorieName ?? "Ecoles Sup",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
