import 'dart:convert';
import 'dart:async';
import 'package:apolobytes/scr/models/produtos.dart';
import 'package:apolobytes/scr/models/restaurantes.dart';
import 'package:http/http.dart' as http;


  /*List<Restaurante> get restaurantes{
    return List.from(_restaurantes);
  }*/

  Future<List<Restaurante>> fetchRestaurantes() async {
    List<Restaurante> _restaurantes = [];
    await http
        .get(Uri.parse("https://apolo-bytes.000webhostapp.com/getRestaurantes.php"))
        .then((http.Response response){
          //print(response.body);
          final List fetchedData = json.decode(response.body);
          print(fetchedData);
          fetchedData.forEach((data) {
            Restaurante restaurante = Restaurante(
              id: int.parse(data["idrestaurantes"]),
              name: data["nome"],
              imagePath: data["imagem"],
              location: data["localizacao"],
              ementa: int.parse(data["ementa_idemente"]),
            );
            _restaurantes.add(restaurante);
          });
          print(_restaurantes);
        });
        return _restaurantes;  
  }

  /*Future<List<Restaurante>> fetchRestaurante() async {
  final response =
      await http.get(Uri.parse('http://192.168.137.1/apolobytes/api/restaurantes/getRestaurantes.php'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return List<Restaurante>.from(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load restaurante');
  }
}*/

Future<List<Product>> fetchProducts(int ementa) async {
    List<Product> _produtos = [];
    await http
        .get(Uri.parse("https://apolo-bytes.000webhostapp.com/getProdutos.php?ementa=${ementa}"))
        .then((http.Response response){
          //print(response.body);
          final List fetchedData = json.decode(response.body);
          print(fetchedData);
          fetchedData.forEach((data) {
            Product produto = Product(
              id: int.parse(data["idrefeicoes"]),
              name: data["nome"],
              imagePath: data["imagem"],
              price: double.parse(data["preco"]),
            );
            _produtos.add(produto);
          });
          print(_produtos);
        });
        return _produtos;  
  }




