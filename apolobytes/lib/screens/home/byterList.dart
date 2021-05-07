import 'package:apolobytes/screens/home/byterTile.dart';
import 'package:apolobytes/models/byter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ByterList extends StatefulWidget {
  @override
  _ByterListState createState() => _ByterListState();
}

class _ByterListState extends State<ByterList> {
  @override
  Widget build(BuildContext context) {

    final byters = Provider.of<List<Byter>>(context);

    return ListView.builder(
      itemCount: byters.length,
      itemBuilder: (context, index) {
        return ByterTile(byter: byters[index]);
      },
    );
  }
}