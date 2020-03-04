import 'package:flutter/material.dart';
class CouncoursCard extends StatelessWidget {
  final String name;
  final Widget icon;
  
  final Function onPressed;

  const CouncoursCard({Key key, this.name,this.onPressed, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(name?? "Concours"),
      ),
      trailing: IconButton(
        // padding: EdgeInsets.all(5),
        icon: icon,
        onPressed: onPressed
      ),
    );
  }
}
