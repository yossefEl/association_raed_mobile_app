import 'package:association_raed/components/concours_card.dart';
import 'package:association_raed/models/tawjih/concourat_model.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';

class ConcoursScrollingCards extends StatelessWidget {
  final String title;
  final List<ConcouratModel> concours;

  final String filiereName;

  final int indexS;

  final int indexCat;

  final Function onPressed;

  const ConcoursScrollingCards(
      {Key key, this.title, this.onPressed, this.concours, this.filiereName, this.indexS, this.indexCat})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(concours.length);
    return Container(
      height:concours?.length!=1?200:150,
      alignment: Alignment.topLeft,
      child: Column(
        
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(title ?? "Title", style: Styles.titleTextSyle),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: concours?.length ?? 0,
              itemBuilder: (context, index) => ConcourCard(

                indexCat: indexCat,
                indexS: indexS,
                indexCC: index,
                filiereName: concours[index].getFiliereName,
                
              ),
              padding: concours?.length==1 ?EdgeInsets.only( left:16):EdgeInsets.symmetric( horizontal: 16),
              physics: BouncingScrollPhysics(),
              scrollDirection: concours?.length==1?Axis.vertical:Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
