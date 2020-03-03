class SocialMediaModel {
  String _icon;
  String _socialName;
  String _statistics='';
  String get getIcon => _icon;
  String get getSocialName => _socialName;
  String get getStatistics => _statistics;

  SocialMediaModel({
    String icon,
    String socialName,
    List statistics,
  }) {
    _icon = icon;
    _socialName = socialName;
    for (var item in statistics) {
      _statistics += '$item\n';
    }
  }
}
