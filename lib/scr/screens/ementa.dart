import 'package:flutter/material.dart';
import 'package:apolobytes/scr/widgets/screen_navigation.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';
import 'package:apolobytes/scr/models/produtos.dart';
import 'package:apolobytes/scr/http/http.dart';

class Ementa extends StatefulWidget {
  final int ementa;

  const Ementa({@required this.ementa});

  @override
  _EmentaState createState() => _EmentaState();
}

class _EmentaState extends State<Ementa> {
  Future<List<Product>> produtos;

  @override
  void initState() { 
    produtos = fetchProducts(widget.ementa);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: produtos,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  Product produto = snapshot.data[index];
                  return Padding(
                      padding: EdgeInsets.fromLTRB(18, 16, 18, 0),
                      child: GestureDetector(
                        onTap: (){
                        //changeScreen(_,Details(product: productsList[index],));
                        },
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.orange[100],
                                offset: Offset(0, 13),
                                blurRadius: 15),
                          ]),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 35),
                                child: Column(
                                  children: <Widget>[

                                    CustomText(
                                      text: produto.name, weight: FontWeight.bold,
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(top:5),
                                      child: CustomText(
                                      text: "${produto.price}€",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Spacer(),

                              Column(
                                children: <Widget>[
                                  Image.asset(
                                    "images/${produto.imagePath}",
                                    width: 180,
                                    height: 110,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              }),
        ),
    ),
    );
    }
  }