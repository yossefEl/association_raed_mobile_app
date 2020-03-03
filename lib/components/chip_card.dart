import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class ChipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: EdgeInsets.only(left: 34),
                    child: Text(
                      "Our goals",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  );
  }
}