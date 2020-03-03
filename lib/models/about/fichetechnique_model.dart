class FicheTechniqueModel {
  String _title;
  String _description;
  String _icon;
  String get getTitle => _title;
  String get getDescription => _description;
  String get getIcon => _icon;

  FicheTechniqueModel(
    String title,
    String description,
    String icon,
  ) {
    _title = title;
    _description = description;
    _icon = icon;
  }
}
