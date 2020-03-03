
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
      child: Container(
        width: 140,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            Shadows.cardShadow,
          ],
          borderRadius: Radii.k10pxRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 122,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(8, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Image.asset(
                "assets/images/marrakech-3.png",
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(left: 6, right: 5, bottom: 10),
              child: Text(
                "Lorem ipsum dolor sit amet",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
