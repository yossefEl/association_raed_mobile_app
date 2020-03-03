import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/components/page_not_found_error.dart';
import 'package:association_raed/components/school_categorie_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'list_schools.dart';

class SchoolCategoriesPage extends StatefulWidget {
  @override
  _SchoolCategoriesPageState createState() => _SchoolCategoriesPageState();
}

class _SchoolCategoriesPageState extends State<SchoolCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolsBloc>(
      builder: (context, orientation, child) {
        return Scaffold(
            body: orientation.getLoadingState == LoadingState.loading
                ? Center(child: CircularProgressIndicator())
                : orientation.getLoadingState == LoadingState.done
                    ? Container(
                        child: Container(
                          padding: EdgeInsets.only(top: 70, bottom: 70),
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount:
                                orientation.getCategories.length + 1 ?? 0,
                            itemBuilder: (context, i) => i <
                                    orientation.getCategories.length
                                ? SchoolCategorieCard(
                                    categorieImage: orientation
                                        .getCategories[i].getCategorieImage,
                                    cardColor: orientation
                                        .getCategories[i].getCardColor,
                                    categorieName: orientation
                                        .getCategories[i].getCategorieNameFr,
                                    categorieNameAr: orientation
                                        .getCategories[i].getCategorieNameAr,
                                    onPressed: () {
                                      // orientation.getSchoolsData();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              curve: Curves.easeIn,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: i <
                                                      orientation
                                                          .getCategories?.length
                                                  ? ListSchoolsPage(
                                                      categorieId: i)
                                                  : Scaffold(
                                                      body: NotFoundErrorPage(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    )));
                                    },
                                  )
                                : Container(padding: EdgeInsets.all(30)),
                          ),
                        ),
                      )
                    : UnknownErrorPage(
                        onPressed: () {
                          orientation.getSchoolsData();
                        },
                      ));
      },
    );
  }
}
