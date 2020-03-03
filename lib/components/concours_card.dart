import 'package:association_raed/models/tawjih/concourat_model.dart';
import 'package:association_raed/pages/raed_tawjih_app/concours_of_branche.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/radii.dart';
import 'package:association_raed/utils/shadows.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ConcourCard extends StatelessWidget {
  final int indexCC;
  final String filiereName;

  final int indexS;

  final int indexCat;

  const ConcourCard({Key key, this.filiereName, this.indexCC, this.indexS, this.indexCat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.only(right: 16, bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
    borderRadius: Radii.k10pxRadius,
    color: Colors.white,
    boxShadow: [Shadows.cardShadow],
      ),
      child: FlatButton(
    shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
    onPressed: () {
     Navigator.push(context, PageTransition(child: CouncoursOfBranche(
       indexCC:indexCC,
       indexCat: indexCat,
       indexS: indexS,
     ), type: PageTransitionType.fade));
    },
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ConfigSize.screenWidth * 0.3,
            child: Text(
              filiereName ??"Undefined",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
