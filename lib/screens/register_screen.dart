import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'auth_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: SafeArea(
          child: SingleChildScrollView(
            // Wrap in SingleChildScrollView
            child: Form(
              key: _formKey, // Add Form widget for validation
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Image.asset(AssetPaths.backButton),
                  const SizedBox(height: 3),
                  const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Create an account to access all the features of Maxpense!',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  const Text('Email', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Ex: abc@example.com',
                      hintStyle: const TextStyle(color:Colors.grey),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                            AssetPaths.iconEmail

                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Your Name', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Ex: Saul Ramirez',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                            AssetPaths.imgName

                        ),                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Password', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                            AssetPaths.imgPassword

                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide:
                        const BorderSide(color: Colors.blue, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextButton(
                      onPressed: _isLoading ? null : () => _signUp(context),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                          : const Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?',
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final user = await _auth.createUserWithEmailAndPassword(
            _emailController.text.trim(),
            _passwordController.text.trim()
        );
        if (user != null) {
          Fluttertoast.showToast(msg: 'Success', toastLength: Toast.LENGTH_SHORT);
          goToHome(context);
        } else {
          Fluttertoast.showToast(msg: "Error", toastLength: Toast.LENGTH_SHORT);
        }
      } catch (e) {
        log("Error: $e");
        // You can show a message using Fluttertoast or any other package
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void goToHome(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
