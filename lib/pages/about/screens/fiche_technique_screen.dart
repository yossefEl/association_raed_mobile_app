import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/components/fiche_technique_card.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FicheTechniqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsBloc>(
      builder: (context, about, child) {
        return about.getLoadingState == LoadingState.loading
            ? Center(child: CircularProgressIndicator())
            : about.getLoadingState == LoadingState.done
                ? ListView(
      physics:BouncingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        
         Text("FICHE TECHNIQUE\nDE L’ASSOCIATION".toUpperCase(),style: Styles.titleTextSyle,textAlign: TextAlign.center,),
        
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: about.getFicheTechnique?.length??0,
          itemBuilder: (c,i)=>FicheCard(
            description: about.getFicheTechnique[i].getDescription,
            title: about.getFicheTechnique[i].getTitle,
            icon: about.getFicheTechnique[i].getIcon,
          ),
        ),
      ],
    ):UnknownErrorPage(onPressed: (){about.getAboutUsFirebase();},);
      },
    );
  }
}

