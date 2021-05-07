import 'package:flutter/material.dart';
import 'package:apolobytes/models/byter.dart';

class ByterTile extends StatelessWidget {

  final Byter byter;
  ByterTile({ this.byter });

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
          title: Text(byter.name),
          //subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}