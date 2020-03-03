import 'package:association_raed/enums/firebase_auth_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc with ChangeNotifier {
  // UserModel _currentUser;
  FirebaseUser _firebaseUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  String _firebaseMessage;
  bool _isAuthenticated;
  String get getFirebaseMessage => _firebaseMessage;
  bool get isAuthenticated => _isAuthenticated ?? false;
  set setIsAuthenticated(bool isAuth) {
    _isAuthenticated = isAuth;
    notifyListeners();
  }

  set setFirebaseMessage(String msg) {
    _firebaseMessage = msg;
    notifyListeners();
  }

  set setFirebaseUser(FirebaseUser user) {
    _firebaseUser = user;
    notifyListeners();
  }
  // login with password and email

  loginWithEmailAndPassword({String userEmail, String userPass}) async {
    _auth
        .signInWithEmailAndPassword(email: userEmail, password: userPass)
        .then((auth) {
      if (auth.user != null) {
        setIsAuthenticated = true;
      } else {
        setIsAuthenticated = false;
      }
      print(auth.user);
    }).catchError((error) {
      setFirebaseMessage =
          FirebaseAuthErros.getFirebaseMessage(error.code.toString());
    });
  }

//  login with google

  signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await _auth.signInWithCredential(credential).then((auth) {
      if (auth.user == null) {
        setIsAuthenticated = false;
      } else if (auth.user != null) {
        setIsAuthenticated = true;
      }
    }).catchError((error) {
      setFirebaseMessage =
          FirebaseAuthErros.getFirebaseMessage(error.code.toString());
      setIsAuthenticated = false;
    });
  }

  

//  login with facebook

//  -----------------------------------------//
//          to shared prefrences            //
//  -----------------------------------------//

  //  -----------------------------------------//
 //                 log out                   //
//  -----------------------------------------//

void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }


  logoutFirebasePassAndEmail(){
    _auth.signOut();
  }


}
