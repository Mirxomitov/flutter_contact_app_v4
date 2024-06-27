import 'package:flutter/material.dart';

class Confirmation {
  static bool confirmationWithSnackbar(TextEditingController emailController, TextEditingController passwordController, context) {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email and password must not be empty", style: TextStyle(color: Colors.white)),
        ),
      );
      return false;
    }

    // email confirmation code
    final email = emailController.text;
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailPattern.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email is not valid", style: TextStyle(color: Colors.white)),
        ),
      );
      return false;
    }

    // password length should be at least 6 characters
    if (passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be at least 6 characters", style: TextStyle(color: Colors.white)),
        ),
      );
      return false;
    }

    return true;
  }
}
