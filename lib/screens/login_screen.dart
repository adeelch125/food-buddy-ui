import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'package:food_buddy/screens/profile_screen.dart';
import 'package:food_buddy/screens/register_screen.dart';
import 'auth_service.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false; // To track loading state

  final _auth = AuthService();

  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() {
      _isLoading = true; // Show progress indicator
    });

    // Simulating API call with a slight delay
    final user = await _auth.loginUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );

    setState(() {
      _isLoading = false; // Hide progress indicator
    });

    if (user != null) {
      Fluttertoast.showToast(
        msg: 'Login successful',
        toastLength: Toast.LENGTH_SHORT,
      );
      // Navigate to the DashboardScreen after showing the success toast
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    } else {
      Fluttertoast.showToast(
        msg: 'Login failed. Please try again.',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Login now to track all your expenses ',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                const Text(
                  'and income at a place!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _email,
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
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your Password',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(color:Colors.grey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(
                          AssetPaths.imgPassword

                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  ForgotPasswordScreen()),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: 'Forgot Password?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: _isLoading ? null : _login, // Disable button if loading
                    child: _isLoading
                        ? const CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 56,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            AssetPaths.iconEmail

                        ),
                        SizedBox(width: 10),
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'Register',
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
    );
  }
}
