import 'package:apolobytes/models/myUser.dart';
import 'package:apolobytes/screens/auth/logIn.dart';
import 'package:apolobytes/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser>(context);

    //return either Home or Auth
    if (user == null) {
      return Login();
    } else {
      return Home();
    }
  }
}
