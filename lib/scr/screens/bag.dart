import 'package:apolobytes/scr/screens/home.dart';
import 'package:apolobytes/scr/screens/login.dart';
import 'package:flutter/material.dart';
//import 'package:apolobytes/scr/helpers/style.dart';
import 'package:apolobytes/scr/screens/perfil.dart';
import 'package:apolobytes/scr/models/produtos.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';
import 'package:apolobytes/scr/widgets/bottom_navigation_icons.dart';
import 'package:apolobytes/scr/widgets/screen_navigation.dart';


class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(name: "Pizza",price: 20.0, vendor: "Papa's Pizza",imagePath: "5.jpg");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: () { changeScreen(context, Home());},),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Bag",),
        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset("images/shopping-bag.png",width: 20,height: 20,),
                ),

                Positioned(
                  right: 7,
                  bottom: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color:  Colors.grey[400],
                              offset:  Offset(2,1),
                              blurRadius: 3,
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right:  4.0 ),
                        child: CustomText(text: "2",color: Colors.orange[800],size: 16 ,weight: FontWeight.bold,),
                      )),
                )

              ],
            ),
          ),

        ],
      ),*/
      backgroundColor: Colors.white,
      body: ListView(
          children: <Widget>[
            Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: Colors.black ,),
                        onPressed: () {Navigator.pop(context);},
                      ),
                    ]
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange[800].withOpacity(0.2),
                      offset: Offset(3, 2),
                      blurRadius: 30
                    )
                  ]
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset("images/${product.imagePath}",
                    height: 120,
                    width: 120,),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(text: TextSpan(
                            children: [
                              TextSpan(text: product.name + "\n", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                              TextSpan(text:"\$" + product.price.toString() + "", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300)),
                            ]
                          ),),

                          IconButton(icon: Icon(Icons.delete), onPressed: null)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: _buildTotalContainer(),  
      );
  }
    Widget _buildTotalContainer() {
    return Container(
      height: 220.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "20.0",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Desconto",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0.0",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Taxa de Entrega",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "0.5",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "20.5",
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange[800],
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Realizar o Pedido",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
