import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String postDate;
  final String image;
  final String description;
  final Function onPressed;

  const PostCard(
      {Key key,
      this.title,
      this.postDate,
      this.image,
      this.description,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(image);

    return InkWell(
        onTap: onPressed,
        radius: 10,
        child: Container(
            height: 220,
            width: ConfigSize.screenWidth - 32,
            decoration: BoxDecoration(
                borderRadius: Radii.k10pxRadius,
                color: Colors.white,
                boxShadow: [Shadows.cardShadow]),
            margin: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: Radii.k10pxRadius,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: ConfigSize.screenWidth - 32,
                      height: 220,
                      fit: BoxFit.fill,
                      placeholder: (_, t) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (_, text, object) => Container(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.error,
                          color: AppColors.lightPurple,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: Radii.k10pxRadius, color: Colors.white),
                    child: Text(postDate.substring(0, 6) ?? "20 Oct"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: Radii.k10pxRadius),
                    padding: EdgeInsets.all(5),
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color:Colors.white,
                            height: 20,
                            child: Text(
                              title ?? "title",
                              overflow: TextOverflow.fade,
                              style: Styles.titleTextSyle.copyWith(fontSize: 13),
                            )),
                        Container(
                          color:Colors.white,
                            height: 40,
                            child: Text(
                              description ?? "description",
                              overflow: TextOverflow.fade,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
