class GoalsModel {
  String _goalTitle;
  String _goalIcon;
  String _goalDescription;
  String get getGoalTitle => _goalTitle;
  String get getGoalDescription => _goalDescription;
  String get getGoalIcon => _goalIcon;
  set setGoalTitle(String title) {
    _goalTitle = title;
  }

  set setGoalIcon(String icon) {
    _goalIcon = icon;
  }

  set setGoalDescription(String description) {
    _goalDescription = description;
  }

  GoalsModel(
    String title,
    String description,
    String icon,
  ) {
    _goalDescription = description;
    _goalIcon = icon;
    _goalTitle = title;
  }
}
