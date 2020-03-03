import 'package:flutter/material.dart';

// class ConcoursExpantionTile extends StatelessWidget {
//   final Function onPressed;
//   final String categorieName;
//   final String categorieNameAr;
//   final String categorieImage;
//   final Color cardColor;

//   ConcoursExpantionTile(
//       {Key key,
//       this.onPressed,
//       this.categorieName,
//       this.categorieImage,
//       this.cardColor,
//       this.categorieNameAr})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           decoration: BoxDecoration(
//               borderRadius: Radii.k10pxRadius,
//               color: Colors.white,
//               boxShadow: [Shadows.cardShadow]),
//           child: Theme(
//               data:
//                   Theme.of(context).copyWith(dividerColor: Colors.transparent),
//               child: ExpansionTile(
//                 title: Text("2001"),
//                 leading: Icon(Icons.layers),
//                 children: <Widget>[
//                   CouncoursCard(),
//                   CouncoursCard(),
//                   CouncoursCard(),
//                   CouncoursCard(),
//                   CouncoursCard(),
//                 ],
//               ))),
//     );
//   }
// }

class CouncoursCard extends StatelessWidget {
  final String name;
  
  final Function onPressed;

  const CouncoursCard({Key key, this.name,this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name?? "Concours"),
      ),
      trailing: IconButton(
        // padding: EdgeInsets.all(5),
        icon: Icon(Icons.file_download),
        onPressed: onPressed
      ),
    );
  }
}
