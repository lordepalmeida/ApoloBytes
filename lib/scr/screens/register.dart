import 'package:apolobytes/scr/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:apolobytes/scr/widgets/screen_navigation.dart';
import 'package:apolobytes/scr/screens/login.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailctrl,passctrl, namectrl;

  @override
  void initState() {
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }
    
  Future register() async{
    var data = {
      "email":emailctrl.text,
      "name":namectrl.text,
      "pass":passctrl.text,
    };

    await http
      .post(Uri.parse("https://apolo-bytes.000webhostapp.com/api/signUp.php"),body:data)
      .then((http.Response response) { 

      if(json.decode(response.body) == "conta existe"){
        Fluttertoast.showToast(msg: "Já existe uma conta associada ao email",toastLength: Toast.LENGTH_SHORT);
      }else{

        if(json.decode(response.body) == "true"){
          changeScreen(context, Home());
        }else{
          Fluttertoast.showToast(msg: "Erro",toastLength: Toast.LENGTH_SHORT);
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.jpg", width: 350,),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: namectrl,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        icon: Icon(Icons.person)
                    ),
                  ),),
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        icon: Icon(Icons.email)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange[800],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(text: "Registar", color: Colors.white, size: 22,)
                    ],
                  ),),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: (){
                changeScreen(context, LoginScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "Já tem conta? ", size: 20,),
                  CustomText(text: "Entrar", size: 20, color: Colors.orange[800],)
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
