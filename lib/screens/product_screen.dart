import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'package:food_buddy/screens/alert_dailog_screen.dart';
import 'package:food_buddy/screens/home_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 0; // State to track the quantity between 0 and 5

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: const SizedBox(
                      height: 20,
                      width: 20,
                      child: Image(image: AssetImage(AssetPaths.imgbackButton)),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage(AssetPaths.imgSearch)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 300,
                width: 320,
                child: Center(
                  child: Image(image: AssetImage(AssetPaths.imgBurger5)),
                ),
              ),
              const Text(
                "Cheeseburger Wendy's Burger",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite.\n"
                "Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce,\n"
                "ripe tomato, and crunchy pickles.",
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Spicy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity = quantity > 0 ? quantity - 1 : 0;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Portion',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity = quantity > 0 ? quantity - 1 : 0;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity = quantity < 5 ? quantity + 1 : 5;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                        BoxShadow(
                        color: Color(0x3F000000),
                    blurRadius: 30,
                    offset: Offset(0, 9),
                    spreadRadius: 0,
                  )
                ],
              ),
                child: const Center(
                        child: Text(
                      '\$8.24',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>AlertDialogScreen()));
                    },
                    child: Container(
                      height: 70,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                          BoxShadow(
                          color: Color(0x3F000000),
                      blurRadius: 30,
                      offset: Offset(0, 9),
                      spreadRadius: 0,
                    )
                          ],
                      ),
                      child: const Center(
                          child: Text(
                        'ORDER NOW',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
