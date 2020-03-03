import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/components/social_media_details_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SocialMediaStatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsBloc>(
      builder: (context, about, child) {
        return about.getLoadingState == LoadingState.loading
            ? Center(child: CircularProgressIndicator())
            : about.getLoadingState == LoadingState.done
                ?  ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Text(
              "Social Media".toUpperCase(),
              style:Styles.titleTextSyle,
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: about.getSocialMediaData.length ?? 0,
              itemBuilder: (c, i) => SocialMediaCard(
                icon: about.getSocialMediaData[i].getIcon,
                title: about.getSocialMediaData[i].getSocialName,
                statistics: about.getSocialMediaData[i].getStatistics,
              ),
            ),
          ],
        ):UnknownErrorPage(onPressed: (){about.getAboutUsFirebase();},);
      },
    );
  }
}
