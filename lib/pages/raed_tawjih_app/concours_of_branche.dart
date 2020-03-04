import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/components/app_bar_card.dart';
import 'package:association_raed/components/concours_list_item_card.dart';
import 'package:association_raed/enums/donwloading_state.dart';
import 'package:association_raed/models/tawjih/concour_model.dart';
import 'package:association_raed/models/tawjih/concourat_model.dart';
import 'package:association_raed/models/tawjih/school_categorie_model.dart';
import 'package:association_raed/models/tawjih/school_model.dart';
import 'package:association_raed/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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
  void initState() {
    super.initState();

    // _bindBackgroundIsolate();
//
  }

  @override
  void dispose() {
    // _unbindBackgroundIsolate();
    super.dispose();
  }

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
                              icon: listConcours[i].getDownloadingState ==
                                      DownloadingState.none
                                  ? Icon(Icons.file_download)
                                  : listConcours[i].getDownloadingState ==
                                          DownloadingState.dowloading
                                      ? Container(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            value: listConcours[i].getProgress/100
                                          ))
                                      : listConcours[i].getDownloadingState ==
                                              DownloadingState.done
                                          ? Icon(
                                              Icons.library_books,
                                              color: Colors.green,
                                            )
                                          : Icon(Icons.error,
                                              color: Colors.red),
                              name: listConcours[i].getFileName,
                              onPressed: () {
                                if (listConcours[i].getDownloadingState ==
                                    DownloadingState.done) {
                                  orientation.openDocument(
                                      taskid: listConcours[i].getTaskId);
                                } else {
                                  orientation.downloadConcoursByURL(
                                      link: listConcours[i].getDownloadLink,
                                      indexCat: widget.indexCat,
                                      indexS: widget.indexS,
                                      indexFN: widget.indexCC,
                                      indexConcour: i);
                                }
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
