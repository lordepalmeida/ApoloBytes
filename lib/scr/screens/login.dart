import 'package:apolobytes/scr/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:apolobytes/scr/widgets/screen_navigation.dart';
import 'package:apolobytes/scr/screens/register.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailctrl,passctrl;

  @override
  void initState() {
    super.initState();
    emailctrl = new TextEditingController();
    passctrl = new TextEditingController();
  }

  Future signIn() async{
    var data = {
      "email":emailctrl.text,
      "pass":passctrl.text,
    };

    await http
        .post(Uri.parse("https://apolo-bytes.000webhostapp.com/api/signIn.php"),body:data)
        .then((http.Response response) {print(response.body);

      if(json.decode(response.body) == "sem conta"){
        Fluttertoast.showToast(
          msg: 'Nenhuma conta associada ao email',
          fontSize: 25, 
          textColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
      else{
        if(json.decode(response.body) == "false"){
        Fluttertoast.showToast(
          msg: 'Password inválida',
          fontSize: 25, 
          textColor: Colors.red,
          toastLength: Toast.LENGTH_SHORT,
        );
        } else{
          changeScreen(context, Home());
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
            
            Column(
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
                 controller: emailctrl,
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
                    controller: passctrl,
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
                      MaterialButton(
                        onPressed: () => signIn(),
                        child: CustomText(text: "Entrar", color: Colors.white, size: 22,)
                        )
                    ],
                  ),),
              ),
            ),
            Divider(),

            GestureDetector(
              onTap: (){
                changeScreen(context, RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "Ainda não tem conta? ", size: 20,),
                  CustomText(text: "Registar", size: 20, color: Colors.orange[800],),
                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}