import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Function onPressed;
  final String image;
  final String date;
  final String title;
  final String time;
  final String location;

  const EventCard(
      {Key key,
      this.onPressed,
      this.image,
      this.date,
      this.title,
      this.time,
      this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      radius: 10,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: Radii.k10pxRadius,
            color: Colors.white,
            boxShadow: [Shadows.cardShadow]),
        margin: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(borderRadius: Radii.k10pxRadius),
                  height: 150,
                  child: ClipRRect(
                    borderRadius: Radii.k10pxRadius,
                    child: image != null
                        ? CachedNetworkImage(
                            imageUrl: image,
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (c, text) => Center(child: CircularProgressIndicator()),
                            errorWidget: (c, s, o) => Center(
                              child: Icon(Icons.error,
                                  color: AppColors.darkPurple),
                            ),
                          )
                        : Image.asset(
                            "assets/images/marrakech-4.png",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 16),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      eventDetails(
                        title ?? "Non défini",
                        Icons.info,
                      ),
                      eventDetails(time ?? "Non défini", Icons.access_time),
                      eventDetails(date ?? "Non défini", Icons.date_range),
                      eventDetails(
                        location ?? "Non défini",
                        Icons.location_on,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventDetails(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(icon),
          ),
          Text(text),
        ],
      ),
    );
  }
}
