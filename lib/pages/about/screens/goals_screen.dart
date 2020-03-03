import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/components/goals_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class GoalsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsBloc>(
      builder: (context, about, child) {

        
        return about.getLoadingState == LoadingState.loading
            ? Center(child: CircularProgressIndicator())
            : about.getLoadingState == LoadingState.done
                ? ListView(
      
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text("Goals".toUpperCase(),style: Styles.titleTextSyle,)),
        ),
        about.getGoals.length==0?Container(child: Icon(Icons.hourglass_empty),):ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: about.getGoals.length??0,
          itemBuilder: (c,i)=>GoalsCard(
            description: about.getGoals[i].getGoalDescription,
            title: about.getGoals[i].getGoalTitle,
            icon: about.getGoals[i].getGoalIcon,
          ),
          
        ),
      ],
    ):UnknownErrorPage(onPressed: (){
      about.getAboutUsFirebase();
    },);
      },
    );
  }
}

 