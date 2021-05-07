import 'package:apolobytes/models/estabelecimento.dart';
import 'package:apolobytes/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:apolobytes/screens/auth/logIn.dart';
import 'package:apolobytes/services/database.dart';
import 'package:provider/provider.dart';
import 'package:apolobytes/screens/home/estabelecimentoList.dart';
import 'package:apolobytes/models/byter.dart';

class Home extends StatelessWidget {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Estabelecimento>>.value(
      value: DatabaseService().estabelecimentos,
      child: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Apolo Bytes'),
          backgroundColor: Colors.orange[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
              },
            )
          ],
        ),
        body: EstabelecimentoList(),
      ),
    );
  }
}
