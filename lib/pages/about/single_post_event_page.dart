import 'package:association_raed/blocs/event_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/small_card.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class SinglePostEventPage extends StatefulWidget {
  final int id;

  const SinglePostEventPage({Key key, this.id}) : super(key: key);

  @override
  _SinglePostEventPageState createState() => _SinglePostEventPageState();
}

class _SinglePostEventPageState extends State<SinglePostEventPage> {
    final listOfcard = <Widget>[
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
    SmallCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsBloc>(
      builder: (context, events, child) {
        return Scaffold(
        body: Container(
      child: Stack(
        children: <Widget>[
          Positioned(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: AppBarCard(
                    showBackArrow: true,
                    title: Image.asset(
                      "assets/images/lg.png",
                      height: 40,
                    ),
                  ))),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: 70),
            
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top:16,bottom: 8,left:16),
                        child:
                            Text(events.getEvents[widget.id].getEventTitle??"Title".toUpperCase(), style:Styles.titleTextSyle)),
                    Container(
                      width: 400,
                      height: 200,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: Radii.k10pxRadius,
                                boxShadow: [Shadows.cardShadow]),
                            child: ClipRRect(
                              borderRadius: Radii.k10pxRadius,
                              child: events.getEvents[widget.id].getImages != null
                          ? CachedNetworkImage(
                              imageUrl: events.getEvents[widget.id].getImages[index],
                              height: 100,
                              placeholder: (c, text) => Container(
                                child: Center(child: CircularProgressIndicator()),
                              ),
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
                          );
                        },
                        itemCount: events.getEvents[widget.id].getImages.length??0,
                        viewportFraction: 0.8,
                        scale: 0.9,
                       autoplay: true,
                       autoplayDelay: 1000,
                        pagination: new SwiperPagination(
                            margin: new EdgeInsets.all(5.0),
                            builder: new DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: AppColors.lightPurple)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          eventDetails(
                           events.getEvents[widget.id].getEventTitle??"Non défini",
                            Icons.info,
                          ),
                          eventDetails(
                               events.getEvents[widget.id].getEventTime??
                            "Non défini", Icons.access_time),
                          eventDetails(
                            events.getEvents[widget.id].getEventDate??
                            "Non défini", Icons.date_range),
                          eventDetails(
                            events.getEvents[widget.id].getEventLocation??
                            "Non défini",
                            Icons.location_on,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(events.getEvents[widget.id].getEventDetails??
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          textAlign: TextAlign.justify,
                          ),
                    )

                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    //   child: ScrollingCards(
                    //     title: "See also",
                    //     cardsList: listOfcard,),
                    // )
                    
                    ,Container(padding: EdgeInsets.only(bottom: 30),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
      },
    );
  }

  Widget eventDetails(String text, IconData icon) {
    return Container(
      padding: EdgeInsets.only(top: 8),
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
