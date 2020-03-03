import 'package:association_raed/blocs/schools_bloc.dart';
import 'package:association_raed/enums/search_state.dart';
import 'package:association_raed/models/tawjih/school_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchItemsBloc with ChangeNotifier {


  List<SchoolModel> _results;
  List<SchoolModel> get getResults => _results ?? [];

  SearchState _searchState;
  SearchState get getSearchState => _searchState;
  set setSearchState(SearchState state) {
    _searchState = state;
    notifyListeners();
  }

  searchResults(BuildContext context, String keyword, categorieId) {
    _results = [];
    notifyListeners();

    try {
      final _schoolsBloc = Provider.of<SchoolsBloc>(context, listen: false);

      for (var school in _schoolsBloc.getCategories[categorieId].getSchools) {
        setSearchState = SearchState.loading;
        print("jellow");
        print(school.toString());
        if (school.getAbout.contains(keyword) ||
            school.getNameAr.contains(keyword) ||
            school.getNameFr.contains(keyword) ||
            school.getTel.contains(keyword) ||
            school.getAbr.contains(keyword) ||
            school.getCity.contains(keyword) ||
            school.getWebsite.contains(keyword) ||
            school.getAdress.contains(keyword)) {
          print("hell");
          _results.add(school);
          notifyListeners();

        }
      }
    } catch (e) {
      print(e.toString());
    }

    if (_results.length != 0)
      setSearchState = SearchState.done;
    else
      setSearchState = SearchState.noResult;

    print(_results);
  }
}
