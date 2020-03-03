import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/concours_list_item_card.dart';
import 'package:association_raed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouncoursOfBranche extends StatefulWidget {
  final int indexCC;
  final int indexCat;
  final int indexS;

  const CouncoursOfBranche({Key key, this.indexCC, this.indexCat, this.indexS})
      : super(key: key);
  @override
  _CouncoursOfBrancheState createState() => _CouncoursOfBrancheState();
}

class _CouncoursOfBrancheState extends State<CouncoursOfBranche> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SchoolsBloc>(
      builder: (context, orientation, child) {
        final listConcours = orientation
            .getCategories[widget.indexCat]
            .getSchools[widget.indexS]
            .getConcours[widget.indexCC]
            .getCoucouratList;
        return Scaffold(
            backgroundColor: AppColors.lightGrey,
            body: Stack(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.only(top: 70),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: listConcours?.length ?? 0,
                        itemBuilder: (context, i) => CouncoursCard(
                              name: listConcours[i].getFileName,
                              onPressed: () {
                                orientation.downloadConcoursByURL(
                                    listConcours[i].getDownloadLink);
                              },
                            )

                        //  ConcoursExpantionTile(
                        //   categorieImage: null,
                        //   cardColor: Colors.black,
                        //   categorieName: "fwefew",
                        //   categorieNameAr: "grgr",
                        //   onPressed: () {
                        //     // orientation.getSchoolsData();
                        //   },
                        // ),
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
                Container(padding: EdgeInsets.all(30))
              ],
            ));
      },
    );
  }
}
