import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:apolobytes/scr/models/produtos.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';



class Details extends StatefulWidget {
   final Product product;

  const Details({@required this.product});


  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              //width: MediaQuery.of(context).size.width,
              height: 300,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      AssetImage('images/${widget.product.imagePath}'),
                      AssetImage('images/${widget.product.imagePath}'),
                      AssetImage('images/${widget.product.imagePath}')
                    ],
                    dotBgColor: Colors.white,
                    dotColor: Colors.grey,
                    dotIncreasedColor: Colors.red,
                    dotIncreaseSize: 1.2 ,
                    autoplay: false,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: Colors.black ,),
                        onPressed: () {Navigator.pop(context);},
                      ),


                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: <Widget>[
                                  Image.asset("images/shopping-bag.png",width: 30,height: 30,),

                                ],
                              ),
                            ),
                            Positioned(
                              right: 5,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white ,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset:  Offset(2,1),
                                          blurRadius: 3,
                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4.0, right:  4.0 ),
                                    child: CustomText(text: "2",color: Colors.orange[800],size: 18 ,weight: FontWeight.bold,),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 20,
                    bottom: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(2,1 ),
                            blurRadius: 3,
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child:  Icon(Icons.favorite,size: 22,color: Colors.orange[800]),
                      ),

                    ),

                  )
                ],
              ),
            ),
            CustomText(text: widget.product.name,size: 26,weight: FontWeight.bold),
            CustomText(text: widget.product.price.toString() + "€" ,size: 20,weight: FontWeight.w400),

            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove,size: 36,), onPressed: (){}),
                ),

                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28,12,28,12),
                      child: CustomText(text: "Adicionar",color: Colors.white,size: 24,weight: FontWeight.w600,),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add,size: 36,color: Colors.orange[800],), onPressed: (){}),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
