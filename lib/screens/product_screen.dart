import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'package:food_buddy/screens/home_screen.dart';
class ProductScreen extends StatelessWidget{
  const ProductScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 20),
        child: SafeArea(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },
                    child: const SizedBox(
                      height: 20,
                        width: 20,
                        child: Image(image: AssetImage(AssetPaths.imgbackButton))
                    ),
                  ),
                  const SizedBox(
                   width: 290,
                  ),

                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage(AssetPaths.imgSearch)),
                  )
                ],
              ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 300,
                width: 320,
                child: Center(child: Image(image: AssetImage(AssetPaths.imgBurger5)))),
              const Text("Cheeseburger Wendy's Burger",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              const Text("The Cheeseburger Wendy's Burger is a classic fast \n "
                  "food burger that packs a punch of flavor in every bite.\n "
                  "Made with a juicy beef patty cooked to perfection, it's \n "
                  "topped with melted American cheese, crispy lettuce,\n"
                  " ripe tomato, and crunchy pickles."),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Column(
                    children: [
                      Text('Spicy',style: TextStyle(fontWeight: FontWeight.bold),),

                    ],
                  )
                ],
              )
            ],

          ),
        ),
      ),
    );
  }}