import 'package:ecommerce/Favourite/favourite.dart';
import 'package:ecommerce/Market/market.dart';
import 'package:ecommerce/cart/cart.dart';
import 'package:ecommerce/components/constance/color.dart';
import 'package:ecommerce/components/navdrawer/nav.dart';
import 'package:ecommerce/menu/menu.dart';
import 'package:ecommerce/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var indexed=0;
  List<Widget> screens=[
    Market(),
    Favourite(),
    Cart(),
    Menu(),



  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      return false;

    },
      child: Scaffold(
       


        bottomNavigationBar:BottomNavigationBar(
          type:BottomNavigationBarType.fixed,

          currentIndex: indexed,
          onTap: (index){

            setState(() {
              indexed=index;
            });
          },
          selectedItemColor:defaultcolor2,

          backgroundColor:Colors.white,
          unselectedItemColor: Colors.grey[700],
           //
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Fav'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),



          ],
        ),
       appBar:
        AppBar(
          backgroundColor: defaultColor,
          // Color(0xffB9E0FF),
leading: Padding(
  padding: const EdgeInsetsDirectional.only(start: 10),
  child:   Image.asset('assets/images/shop.png'),
),

        ),
        body: screens[indexed],
      ),
    );
  }
}
