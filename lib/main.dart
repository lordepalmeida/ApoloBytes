import 'package:flutter/material.dart';
import 'package:apolobytes/scr/screens/home.dart';
import 'package:apolobytes/scr/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //final RestaurantesModel restaurantesModel = RestaurantesModel();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return /*ScopedModel<RestaurantesModel>(
      model: restaurantesModel,
      child:*/ MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apolo Bytes',
        theme: ThemeData(
          primaryColor: Colors.orange[800],
        ),
        home: Home(/*restaurantesModel: restaurantesModel*/),
      );
    //);
  }
}