import 'package:apolobytes/models/estabelecimento.dart';
import 'package:apolobytes/screens/home/estabelecimentoTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EstabelecimentoList extends StatefulWidget {
  @override
  _EstabelecimentoListState createState() => _EstabelecimentoListState();
}

class _EstabelecimentoListState extends State<EstabelecimentoList> {
  @override
  Widget build(BuildContext context) {

    final estabelecimentos = Provider.of<List<Estabelecimento>>(context);

    return ListView.builder(
      itemCount: estabelecimentos.length,
      itemBuilder: (context, index) {
        return EstabelecimentoTile(estabelecimento: estabelecimentos[index]);
      },
    );
  }
}