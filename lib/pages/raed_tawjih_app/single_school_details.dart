import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/scrolling_cards.dart';
import 'package:association_raed/models/tawjih/school_model.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SchoolDetailsPage extends StatefulWidget {
  final schoolIndex;
  final categorieIndex;
  const SchoolDetailsPage({Key key, this.schoolIndex, this.categorieIndex})
      : super(key: key);
  @override
  _SchoolDetailsPageState createState() =>
      _SchoolDetailsPageState(schoolIndex, categorieIndex);
}

class _SchoolDetailsPageState extends State<SchoolDetailsPage> {
  final schoolIndex;
  final categorieIndex;

  _SchoolDetailsPageState(this.schoolIndex, this.categorieIndex);
  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolsBloc>(
      builder: (context, orientation, child) {
        final SchoolModel schoolDetails =
            orientation.getCategories[categorieIndex].getSchools[schoolIndex];
        return Scaffold(
            body: Container(
          child: Stack(
            children: <Widget>[
             
              Positioned(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.only(top: 70),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        Container(
                            padding:
                                EdgeInsets.only(top: 16, bottom: 8, left: 16),
                            child: Text(
                                schoolDetails.getNameFr ??
                                    "School name".toUpperCase(),
                                style: Styles.titleTextSyle)),
                        schoolDetails.getImages?.length != 0
                            ? Container(
                                width: 400,
                                height: 200,
                                child: Swiper(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          borderRadius: Radii.k10pxRadius,
                                          boxShadow: [Shadows.cardShadow]),
                                      child: ClipRRect(
                                        borderRadius: Radii.k10pxRadius,
                                        child: new Image.network(
                                          "http://via.placeholder.com/288x188",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: 10,
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
                              )
                            : Container(
                                height: 0,
                                width: 0,
                              ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: <Widget>[
                                DetailsCard(
                                  icon: Icons.info,
                                  info: schoolDetails.getAbr +
                                      '\n' +
                                      schoolDetails.getNameFr +
                                      '\n' +
                                      schoolDetails.getNameAr,
                                ),
                                DetailsCard(
                                  icon: Icons.call,
                                  info: schoolDetails.getTel,
                                ),
                                DetailsCard(
                                  icon: FontAwesomeIcons.link,
                                  info: schoolDetails.getWebsite,
                                ),
                                DetailsCard(
                                  icon: Icons.location_on,
                                  info: schoolDetails.getAdress,
                                ),
                                DetailsCard(
                                  icon: FontAwesomeIcons.city,
                                  info: schoolDetails.getCity,
                                ),
                                DetailsCard(
                                  icon: FontAwesomeIcons.landmark,
                                  info: schoolDetails.getSector,
                                ),
                              ],
                            )),

                            schoolDetails.getConcours.length!=0
                            ? ConcoursScrollingCards(
                                title: "Councours",
                                concours: schoolDetails.getConcours,
                                indexCat:categorieIndex ,
                                indexS: schoolIndex,
                              )
                            : Container(
                                width: 0,
                                height: 0,
                              ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16)
                              .add(EdgeInsets.only(top: 16)),
                          child: Text(
                            schoolDetails.getAbout ??
                                "Something went wrong. we expected an about paragraph for this school but we get NOTHING :( !",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        
                              
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                        )
                      ],
                    ),
                  ),
                ),
              ),
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
            ],
          ),
        ));
      },
    );
  }
}

class DetailsCard extends StatelessWidget {
  final IconData icon;
  final String info;

  const DetailsCard({Key key, this.icon, this.info}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        width: ConfigSize.screenWidth * 0.9,
        decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          color: Colors.white,
          boxShadow: [Shadows.cardShadow],
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 30,
                  color: AppColors.lightPurple,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                child: Text(
                  info ?? "About",
                  textAlign: TextAlign.center,
                ),
              ),
            ]));
  }
}
