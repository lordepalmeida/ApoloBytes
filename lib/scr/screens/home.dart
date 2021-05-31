import 'package:apolobytes/scr/widgets/screen_navigation.dart';
import 'package:apolobytes/scr/models/restaurantes.dart';
import 'package:apolobytes/scr/http/http.dart';
import 'package:apolobytes/scr/screens/bag.dart';
//import 'package:apolobytes/scr/screens/login.dart';
import 'package:apolobytes/scr/screens/perfil.dart';
import 'package:apolobytes/scr/widgets/categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:apolobytes/scr/widgets/custom_text.dart';
import 'package:apolobytes/scr/widgets/featured_products.dart';
import 'package:apolobytes/scr/widgets/small_floating_button.dart'; 
import 'package:apolobytes/scr/screens/ementa.dart';

class Home extends StatefulWidget {
  //final RestaurantesModel restaurantesModel;

  //Home({this.restaurantesModel});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Restaurante>> restaurantes;

  @override
  void initState() { 
    restaurantes = fetchRestaurantes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        backgroundColor: Colors.orange[800],
            title: Container(
              child: Align(
                alignment: Alignment.center,
                child: CustomText(text: "Apolo Bytes", color: Colors.white),
              ),
            ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {changeScreen(context, ShoppingBag());},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Colors.green, borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange[800]
              ),
              currentAccountPicture: Image(image: AssetImage("images/avatar.png")),
              accountName: CustomText(text: "Olá, username!", color: Colors.white, weight: FontWeight.bold, size: 18,), accountEmail:CustomText(text: "Apolo Bytes", color: Colors.white,), ),
          ListTile(
            onTap: (){},
            leading: Icon(Icons.home),
            title: CustomText(text: "Home"),
          ),

            ListTile(
              onTap: (){changeScreen(context, ProfilePage());},
              leading: Icon(Icons.person),
              title: CustomText(text: "A minha conta"),
            ),

            ListTile(
              onTap: (){},
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "Os meus pedidos"),
            ),
            
            ListTile(
              onTap: (){},
              leading: Icon(Icons.logout),
              title: CustomText(text: "Terminar sessão"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[800],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                     ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.orange[800],
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: "Procura produtos ou restaurantes",
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: Colors.orange[800],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            
            Categories(),

            SizedBox(
              height: 5,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 1)),

                  Icon(Icons.flash_on),

                  CustomText(
                    text: "Promoções",
                    size: 20,
                    color: Colors.grey[800],
                  ),
                  Spacer(),
                  CustomText(
                    text: "ver todas",
                    size: 16,
                    color: Colors.orange[800],
                  ),
                ],
              ),
            ),
            Promotions(),
            Divider(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                      Icons.thumb_up,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 5, 0)),
                  CustomText(
                    text: "Mais Populares",
                    size: 20,
                    color: Colors.grey[800],
                  ),
                  Spacer(),
                  CustomText(
                    text: "ver todos",
                    size: 16,
                    color: Colors.orange[800],
                  ),
                  
                ],
              ),
            ),

            Container(
              height: 500,
              child: FutureBuilder(
                future: restaurantes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Restaurante restaurante = snapshot.data[index];
                        return Padding(
              padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 8.5),
              child: GestureDetector(
                  onTap: (){
                   changeScreen(context, Ementa(ementa: restaurante.ementa,));
                  },
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/${restaurante.imagePath}")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          )),
                    ),
                  )),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 15),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "${restaurante.name}\n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Localização: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: restaurante.location,
                                  style: TextStyle(fontSize: 16)),
                            ], style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
                    ),
                        );
                      
                    },
                  );
                }
                return CircularProgressIndicator();
                },                  
              ),
            ),

            /*
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/food.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          )),
                    ),
                  )),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Jó Bifanas \n",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "preço médio: ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: "\4.99€ \n",
                                  style: TextStyle(fontSize: 16)),
                            ], style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/food.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                      )),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Canto Alentejano \n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "preço médio: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                  TextSpan(
                                      text: "\5.99€ \n",
                                      style: TextStyle(fontSize: 16)),
                                ], style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/food.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow[900],
                                    size: 20,
                                  ),
                                ),
                                Text("4.5"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )),
                        ),
                      )),
                  Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Pedaço do céu \n",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: "preço médio: ",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300)),
                                  TextSpan(
                                      text: "\5.99€ \n",
                                      style: TextStyle(fontSize: 16)),
                                ], style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

/*class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: 'What would you like to eat?',
                        size: 18,
                      )),
                  Stack(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.notifications_none),
                        onPressed: () {},
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ],
                  )
                ]),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(1, 1),
                      blurRadius: 4),
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Find food and restaurant",
                      border: InputBorder.none,
                    ),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured",
                size: 20,
                color: Colors.grey,
              ),
            ),


           Featured(),

            Padding (
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                size: 20,
                color: Colors.grey,
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/food.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        SmallButton(Icons.favorite),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(Icons.star, color: Colors.yellow[900],size: 20,),
                                ),
                                Text("4.5"),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                  ),

                  Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20 ),bottomRight: Radius.circular(20),

                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),

                          ],
                        )
                      ),
                    ),
                  )),
                  Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "Pizza with Pork \n",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                              TextSpan(text: "by: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                              TextSpan(text: "Papas Pizza \n",style: TextStyle(fontSize: 16)),

                            ], style: TextStyle(color: Colors.white)
                          ),),

                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "\₵25.00 \n",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),

                              ], style: TextStyle(color: Colors.white)
                          ),),

                        ),


                      ],
                    ),
                  ))
                  
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 73,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            BottomNavIcon(
              image: "home.png",
              name: "Home",
            ),

            BottomNavIcon(
              onTap: (){
                changeScreen(context, ShoppingBag());
              },
              image: "shopping-bag.png",
              name: "Card",
            ),

          BottomNavIcon(
            onTap: (){
                changeScreen(context, ProfilePage());
              },
            image: "avatar.png",
            name: "Account",
          ),



          ],
        ),
      ),


    );
  }
}*/
