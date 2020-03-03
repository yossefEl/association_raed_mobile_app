import 'package:association_raed/components/primary_button.dart';
import 'package:association_raed/utils/colors.dart';
import 'package:association_raed/utils/config_size.dart';
import 'package:association_raed/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DisconnectedErrorPage extends StatelessWidget {
  final Function  onPressed;
  const DisconnectedErrorPage({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    
      child: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/error_icons/disconnected.png",height: 150,),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),

              alignment: Alignment.center,
              width: ConfigSize.screenWidth*0.6,
              child: Text("Check your connection and try again.")),
            Center(
              child: PrimaryButton(
                onPressed: onPressed,
                color: AppColors.darkPurple,
                gradient: Gradients.primaryGradient,
                height: 50,
                width: ConfigSize.screenWidth*0.6,
                icon:Icon( FontAwesomeIcons.redo,color: Colors.white,size: 15,),
                text: "Try again",
              ),
            )
            
          ],
        ),
      ),
    );
  }
}