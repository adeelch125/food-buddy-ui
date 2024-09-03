import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_buddy/assets/asset_paths.dart';
class ProductScreen extends StatelessWidget{
  const ProductScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 20,top: 20),
        child: SafeArea(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Center(child: Image(image: AssetImage(AssetPaths.imgBurger5))),
              Text("Cheeseburger Wendy's Burger",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              Text("The Cheeseburger Wendy's Burger is a classic fast \n food burger that packs a punch of flavor in every bite.\n Made with a juicy beef patty cooked to perfection, it's \n topped with melted American cheese, crispy lettuce,\n ripe tomato, and crunchy pickles.")
            ],

          ),
        ),
      ),
    );
  }}