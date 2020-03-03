import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MemberCard extends StatelessWidget {
  final String image;

  final String position;

  final String name;

  final String description;

  const MemberCard({Key key, this.image, this.position, this.name, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        width: ConfigSize.screenWidth * 0.8,
        decoration: BoxDecoration(
            borderRadius: Radii.k10pxRadius,
            color: Colors.white,
            // border: Border.all(color: AppColors.lightPurple)
            boxShadow: [Shadows.cardShadow]
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(8),
              height: ConfigSize.screenWidth * 0.3,
              width: ConfigSize.screenWidth * 0.3,
              decoration: BoxDecoration(
                borderRadius: Radii.k10pxRadius,
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: Radii.k10pxRadius,
                child: image!=null?CachedNetworkImage(imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context,s)=>Center(child: CircularProgressIndicator(),),
                
                errorWidget: (c,s,o)=>Center(child: Icon(Icons.error,color: AppColors.darkPurple,),),
                ):Image.asset("assets/images/39236784.png",
                    fit: BoxFit.cover),
              ),
            ),
            
            Text(
              position??"Flutter Developer",
              style: Styles.titleTextSyle,
            ),

            Text(
              name??"Youssef ELMOUMEN",
              style: Styles.subTitleTextSTyle,
            ),
            Text(description??"Etudiant FST Settat Big data"),
          ],
        ),
      ),
    );
  }
}

