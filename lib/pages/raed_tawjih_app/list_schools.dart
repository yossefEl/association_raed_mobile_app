import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/blocs/search_items_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/list_school_item_card.dart';
import 'package:association_raed/components/page_not_found_error.dart';
import 'package:association_raed/components/search_no_result.dart';
import 'package:association_raed/enums/search_state.dart';
import 'package:association_raed/pages/raed_tawjih_app/single_school_details.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/radii.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ListSchoolsPage extends StatefulWidget {
  final categorieId;

  const ListSchoolsPage({Key key, this.categorieId}) : super(key: key);
  @override
  _ListSchoolsPageState createState() => _ListSchoolsPageState(categorieId);
}

class _ListSchoolsPageState extends State<ListSchoolsPage> {
  final categorieId;
  String _keyword='';
  TextEditingController _searchController;
  @override
  void initState() { 
    super.initState();
    _searchController=TextEditingController();
  }

  _ListSchoolsPageState(this.categorieId);
  @override
  Widget build(BuildContext context) {
    return Consumer2<SchoolsBloc,SearchItemsBloc>(
      builder: (context, orientation,search, child) {
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 75),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: Radii.k10pxRadius,
                          color: Colors.white,
                          boxShadow: [Shadows.cardShadow],
                        ),
                        width: ConfigSize.screenWidth - 32,
                        child: TextFormField(
                      
                          controller: _searchController,
                          onChanged: (keyword){
                            setState(() {
                              _keyword=keyword;
                            });
                            if(categorieId==null|| keyword==null ||keyword.isEmpty) return;
                            search.searchResults(context, keyword, categorieId);
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              hintText: "Search a school",
                              focusColor: AppColors.darkPurple,
                              hoverColor: AppColors.lightPurple,
                              border: OutlineInputBorder(
                                  borderRadius: Radii.k10pxRadius,
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    _keyword.isEmpty? Center(
                      child:ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orientation.getCategories[categorieId]
                                .getSchools?.length ??
                            0,
                        itemBuilder: (c, i) => ListSchoolsItemCard(
                          schoolArName: orientation.getCategories[categorieId]
                              .getSchools[i].getNameAr,
                          schoolFrName: orientation.getCategories[categorieId]
                              .getSchools[i].getNameFr,
                          schoolImage: orientation.getCategories[categorieId]
                                      .getSchools[i].getImages?.length !=
                                  0
                              ? orientation.getCategories[categorieId]
                                  .getSchools[i].getImages[0]
                              : null,
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 300),
                                    child: i <
                                            orientation
                                                .getCategories[categorieId]
                                                .getSchools
                                                ?.length
                                        ? SchoolDetailsPage(
                                            categorieIndex: categorieId,
                                            schoolIndex: i)
                                        : Scaffold(
                                            body: NotFoundErrorPage(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          )));
                          },
                        ),
                      ),
                    ):Center(
                      child: 
                      search.getSearchState==SearchState.loading?
                      Container(
                        margin: EdgeInsets.only(top:100),
                        child: Center(child: CircularProgressIndicator(),)):search.getSearchState==SearchState.done?
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: search.getResults?.length??0,
                        itemBuilder: (c, i) => ListSchoolsItemCard(
                          schoolArName: search.getResults[i].getNameAr,
                          schoolFrName: search.getResults[i].getNameFr,
                          schoolImage:  search.getResults[i].getImages?.length !=0 ?  search.getResults[i].getImages[0]
                              : null,
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 300),
                                    child: i <search.getResults?.length
                                        ? SchoolDetailsPage(
                                            categorieIndex: categorieId,
                                            schoolIndex: i)
                                        : Scaffold(
                                            body: NotFoundErrorPage(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          )));
                          },
                        ),
                      ):Container(

                        margin: EdgeInsets.only(top: 60),
                        child: NoResultFound(onPressed: (){
                          setState(() {
                            _keyword='';
                            _searchController.text='';
                          });
                        },),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: AppBarCard(
                        showBackArrow: true,
                        title: Text(orientation.getCategories[categorieId]
                                .getCategorieNameFr ??
                            "Ecoles Supperieurs"),
                      ))),
            ],
          ),
        );
      },
    );
  }
}
