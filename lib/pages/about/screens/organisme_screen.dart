import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/components/member_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/radii.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

class OrganismeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsBloc>(
      builder: (context, about, child) {
        return about.getLoadingState == LoadingState.loading
            ? Center(child: CircularProgressIndicator())
            : about.getLoadingState == LoadingState.done
                ?  ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "L’ORGANIGRAMME DE L’ASSOCIATION".toUpperCase(),
                style: Styles.titleTextSyle,
                textAlign: TextAlign.center,
              )),
            ),
            ListView.builder(
              padding: EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: about.getOrganismeData.length,
              itemBuilder: (c, i) => MemebersDepartmentCard(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          about.getOrganismeData[i].getMembersDepartmentName??"Members Department name",
                          style: Styles.titleTextSyle.copyWith(
                              color: AppColors.lightPurple),
                        ),
                      ),
                      Container(
                        height: ConfigSize.screenHeight * 0.4,
                        width: ConfigSize.screenWidth * 0.8,
                        constraints: BoxConstraints(maxHeight: 500),
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return MemberCard(
                              name: about.getOrganismeData[i].getMembers[index].getMemberName,
                              image: about.getOrganismeData[i].getMembers[index].getImage,
                              description: about.getOrganismeData[i].getMembers[index].getDescription,
                              position: about.getOrganismeData[i].getMembers[index].getPosition,
                            );
                          },
                          itemCount: about.getOrganismeData[i].getMembers.length??0,
                          itemWidth: 300.0,
                          itemHeight: 400.0,
                          layout: SwiperLayout.TINDER,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ):UnknownErrorPage(onPressed: (){
          about.getAboutUsFirebase();
        },);
      },
    );
  }
}

class MemebersDepartmentCard extends StatelessWidget {
  final Widget child;

  const MemebersDepartmentCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          boxShadow: [Shadows.cardShadow],
          color: Colors.white),
      child: child,
    );
  }
}
