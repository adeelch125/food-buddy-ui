import 'package:flutter/material.dart';
import 'package:food_buddy/assets/asset_paths.dart';
import 'auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = AuthService();
  final TextEditingController _emailController = TextEditingController(); // Controller for the email input

  @override
  void dispose() {
    _emailController.dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Recover your password if you have ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'forgot the password!',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 52,
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
                controller: _emailController, // Link controller to the input field
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Ex: abc@example.com',
                  hintStyle: const TextStyle(color: Colors.grey), // Hint text
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      (AssetPaths.iconEmail) // Replace with your image asset path
                      // Adjust the width of the image as needed
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue, // Border color when not focused
                      width: 1.5, // Border width
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue, // Border color when not focused
                      width: 1.5, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue, // Border color when focused
                      width: 2.0, // Border width when focused
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Container(
                width: double.infinity, // Button takes full width of the screen
                decoration: BoxDecoration(
                  color: Colors.blue, // Background color of the button
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                child: TextButton(


                  onPressed: () async {
                    // Marking the function as async and using await for the AuthService call
                    try {
                      await _auth.sendPasswordResetLink(_emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password reset link sent to your email')),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      // Handle errors and display feedback to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );

                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
