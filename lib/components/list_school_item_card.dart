import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListSchoolsItemCard extends StatelessWidget {
  final Function onPressed;
  final String schoolArName;
  final String schoolFrName;
  final String schoolImage;

  const ListSchoolsItemCard(
      {Key key,
      this.onPressed,
      this.schoolArName,
      this.schoolFrName,
      this.schoolImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        radius: 10,
        child: Container(
          height: 100,
          width: ConfigSize.screenWidth - 32,
          decoration: BoxDecoration(
              borderRadius: Radii.k10pxRadius,
              color: Colors.white,
              boxShadow: [Shadows.cardShadow]),
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
          child: Row(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: Radii.k10pxRadius,
                      color: AppColors.darkPurple),
                  child: schoolImage == null
                      ? Icon(
                          FontAwesomeIcons.graduationCap,
                          color: AppColors.white,
                        )
                      : ClipRRect(
                          borderRadius: Radii.k10pxRadius,
                          child: CachedNetworkImage(
                              imageUrl: schoolImage,
                              fit: BoxFit.cover,
                              placeholder: (c, s) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              errorWidget: (c, s, o) => Center(
                                      child: Icon(
                                    Icons.error,
                                    size: 30,
                                    color: AppColors.darkPurple,
                                  )),
                              height: 100))),
              Container(
                
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(width: ConfigSize.screenWidth*0.6,child: Text(schoolArName??"المدرسة الوطنية لعلوم المهندس",overflow: TextOverflow.fade,)),
                    Container(width: ConfigSize.screenWidth*0.6,child: Text(schoolFrName??"Ecole nationale sc ingenieurs",overflow: TextOverflow.fade,))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
