import 'package:flutter/material.dart';
import 'package:apolobytes/scr/models/category.dart';
import 'custom_text.dart';

List<Category> categoriesList = [

   Category(name: "Shawarmas", image: "salad.png"),
   Category(name: "Pizza", image: "salad.png"),
   Category(name: "Sandes", image: "salad.png"),
   Category(name: "Wafles", image: "salad.png"),
   Category(name: "Kebabs", image: "salad.png"),
   Category(name: "Saladas", image: "salad.png"),
   Category(name: "Peixe", image: "fish.png"),
   Category(name: "Bebidas", image: "pint.png"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                      decoration:
                      BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.red[50],
                            offset: Offset(4, 6),
                            blurRadius: 20),
                      ]),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child:
                        Image.asset("images/${categoriesList[index].image}", width: 50),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text: categoriesList[index].name,
                    size: 14,
                    color: Colors.black,
                  )
                ],
              ),
            );
          }),
    );
  }
}
