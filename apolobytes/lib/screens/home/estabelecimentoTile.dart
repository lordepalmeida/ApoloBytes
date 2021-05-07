import 'package:flutter/material.dart';
import 'package:apolobytes/models/estabelecimento.dart';

class EstabelecimentoTile extends StatelessWidget {

  final Estabelecimento estabelecimento;
  EstabelecimentoTile({ this.estabelecimento });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green[200],
          ),
          title: Text(estabelecimento.name),
          //subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}