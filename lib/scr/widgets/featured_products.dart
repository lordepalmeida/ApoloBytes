import 'package:flutter/material.dart';
import 'package:apolobytes/scr/widgets/screen_navigation.dart';
import 'package:apolobytes/scr/models/produtos.dart';
import 'package:apolobytes/scr/screens/details.dart';


import 'custom_text.dart';

List<Product> productsList = [
  Product(name: "Wraps",price: 20.0,vendor: "Papa's Pizza",imagePath: "5.jpg"),
  Product(name: "Salada de Atum",price: 20.0, vendor: "Papa's Pizza",imagePath: "1.jpg"),
  Product(name: "Pataniscas",price: 20.0,vendor: "Papa's Pizza",imagePath: "3.jpg"),

];

class Promotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 16, 14),
                child: GestureDetector(
                  onTap: (){
                   changeScreen(_,Details(product: productsList[index],));
                  },
                  child: Container(
                    height: 220,
                    width: 200,
                    decoration: BoxDecoration(color: Colors.white70, boxShadow: [
                      BoxShadow(
                          color: Colors.orange[100],
                          offset: Offset(15, 15),
                          blurRadius: 12),
                    ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "images/${productsList[index].imagePath}",
                          height: 140,
                          width: 140,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomText(
                                text: productsList[index].name,
                              ),
                            ),
    
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: CustomText(text: "${productsList[index].price}€",weight: FontWeight.bold,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}

