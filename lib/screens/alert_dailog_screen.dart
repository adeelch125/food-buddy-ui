import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'package:food_buddy/screens/product_screen.dart';

class AlertDialogScreen extends StatelessWidget {
  AlertDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 320,
                height: 350,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: ShapeDecoration(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 47,
                        offset: Offset(0, 19),
                        spreadRadius: -8,
                      )
                    ],
                  ),
                        child: const Center(
                          child: SizedBox(
                            height: 23,
                            width: 36,
                            child: Image(
                              image: AssetImage(AssetPaths.imgCorrect),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Success!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const Text('Your payment was successful.'),
                      const Text('A receipt for this purchase has'),
                      const Text('been sent to your email.'),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context)=>ProductScreen()));
                        },
                        child: Container(
                          width: 220,
                          height: 60,
                          decoration: ShapeDecoration(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Go Back',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
