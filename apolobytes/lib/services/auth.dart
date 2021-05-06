import 'package:flutter/material.dart';
import 'package:apolobytes/models/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
/*import 'package:flutter/cupertino.dart';*/


class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // create user obj baes on firebase user
  MyUser _userFromFirebaseUser(User user){
    return user != null ? MyUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<MyUser> get user{
    return _firebaseAuth.authStateChanges()
      .map((User user) => _userFromFirebaseUser(user));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // register with phone number
  


  // register with email & password
  Future registerEmail(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = credential.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
