import 'package:association_raed/utils/colors.dart';

import 'package:association_raed/utils/shadows.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<Widget> bottomNavBarItems ;

  CustomBottomNavigationBar({Key key, this.bottomNavBarItems}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(borderRadius: BorderRadius.only(
        topLeft:Radius.circular(35),
        topRight:Radius.circular(35),
      ),
      boxShadow: [Shadows.bottomNavigationBarShadow],
      color: AppColors.white,
      
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: bottomNavBarItems.map((item){
            return Expanded(child: Container(margin: EdgeInsets.all(5),
            child: item,
            ),);
          }).toList(),
        ),
      ),
    );
  }
}

