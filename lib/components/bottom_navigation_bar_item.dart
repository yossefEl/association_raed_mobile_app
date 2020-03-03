import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  final Function onPressed;
  final int currentIndex;
  final int thisIndex;
  final IconData icon;
  final String text;

  BottomNavBarItem(
      {Key key,
      this.onPressed,
      this.currentIndex,
      this.thisIndex,
      this.icon,
      this.text})
      : super(key: key);

  @override
  _BottomNavBarItemState createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(

      
      decoration: BoxDecoration(
        borderRadius: Radii.k10pxRadius,
        color: widget.currentIndex == widget.thisIndex
            ? AppColors.lightPurple
            : Colors.transparent,
      ),
      duration: Duration(milliseconds: 350),
      child: Material(
        color: Colors.transparent,
        borderRadius: Radii.k10pxRadius,
        clipBehavior: Clip.antiAlias,

        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: FlatButton(
            hoverColor: AppColors.lightPurple.withOpacity(0.3),
            splashColor: AppColors.lightPurple.withOpacity(0.3),
            highlightColor: AppColors.lightPurple.withOpacity(0.3),
            child: AnimatedContainer(
              height: 45,
              duration: Duration(milliseconds: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    widget.icon,
                    size: 20,color:
                    widget.currentIndex == widget.thisIndex
            ? AppColors.white
            : Colors.black87,
                  ),
                  Text(widget.text??"title",style: TextStyle(color:  widget.currentIndex == widget.thisIndex
            ? AppColors.white
            : Colors.black87,),),
                ],
              ),
            ),
            onPressed: widget.onPressed

            // fillColor: currentIndex==thisIndex? AppColors.lightPurple:Colors.transparent,
            // shape: RoundedRectangleBorder(borderRadius: Radii.k10pxRadius),
            ),
      ),
    );
  }
}
