class FirebaseAuthErros {
  static String getFirebaseMessage(String code) {
    switch (code) {
      case 'ERROR_INVALID_EMAIL':
        return 'Entered email address is malformed';
        break;
      case 'ERROR_WRONG_PASSWORD':
        return 'The password is wrong';
        break;
      case 'ERROR_USER_NOT_FOUND':
        return 'There is no user corresponding to the given email address, or may it has been deleted. Please register if new to this app';
        break;
      case 'ERROR_USER_DISABLED':
        return 'The user related to this email has been disabled';
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'There was too many attempts to sign in as this user';
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        return 'That Email & Password accounts are not enabled';
        break;
      default:
        return "Someting went wrong, please try again!";
    }
  }
}
