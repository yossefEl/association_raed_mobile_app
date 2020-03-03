import 'package:association_raed/blocs/about_us_bloc.dart';
import 'package:association_raed/components/unknown_error.dart';
import 'package:association_raed/enums/loading_state.dart';
import 'package:association_raed/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutBriefScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AboutUsBloc>(
      builder: (context, about, child) {
        return about.getLoadingState == LoadingState.loading
            ? Center(child: CircularProgressIndicator())
            : about.getLoadingState == LoadingState.done
                ? Container(
                    child: ListView(
                      padding: EdgeInsets.all(16),
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Presentation de l'assocation".toUpperCase(),
                            style: Styles.titleTextSyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            about.getBrief ??
                                'Le village Aoulouz, à l’instar de plusieurs centres du sud marocain, recèle de fortes potentialités humaines quantitatives et qualitatives. Il constitue, par ses richesses historiques et culturelles, l’un des pôles dynamiques de la province de Taroudant. Parmi les principales facettes dynamiques marquantes à Aoulouz, figure le tissu associatif. Il a été toujours présent actif et soucieux d’aborder des sujets d’actualitées et relatifs au développement. Au sein de cette dynamique, le 28 Janvier 2018 été marqué par la naissance d’une nouvelle association « RAED». Ce nouveau-né constitue une valeur ajoutée de la trame associative locale. Premièrement par sa spécificité d’être la première association, fondée par des étudiants et des jeunes diplômés des grandes écoles et universités nationales, destinée aux jeunes. Deuxièmement par son nouvel esprit et sa philosophie innovante d’entamer la question de l’éducation et la formation de la personnalité de l’enfant, du collégien, du lycéen, de l’étudiant et du jeune diplômé et le développement de leurs dons et de leurs aptitudes mentales et physiques, dans toute la mesure de leurs potentialités. , ainsi que former une génération de citoyens avertis, conscients de leur impact dans la vie sociétale..',
                            textAlign: TextAlign.justify,
                          
                          ),
                        ),
                      ],
                    ),
                  )
                : UnknownErrorPage(
                    onPressed: () {
                      about.getAboutUsFirebase();
                    },
                  );
      },
    );
  }
}
