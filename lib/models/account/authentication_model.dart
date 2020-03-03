import 'package:association_raed/enums/logged_in_with..dart';

class AuthenticationModel {
  bool _isUserAthenticated;
  LoggedInWith _loggedWith;
  String _sessionExpire;
  bool get getIsUserAthenticated => _isUserAthenticated;
  LoggedInWith get getLoggedWith => _loggedWith;
  String get getSessionExpire => _sessionExpire;
  set setIsUserAthenticated(bool isuserathenticated) {
    _isUserAthenticated = isuserathenticated;
  }

  set setLoggedWith(LoggedInWith loggedwith) {
    _loggedWith = loggedwith;
  }

  set setSessionExpire(String sessionexpire) {
    _sessionExpire = sessionexpire;
  }
}
