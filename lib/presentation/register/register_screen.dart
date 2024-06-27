import 'package:contacts_bloc/domain/repository_v3.dart';
import 'package:contacts_bloc/presentation/main/main_screen.dart';
import 'package:contacts_bloc/utils/components/snacbar_with_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/delete/delete_bloc.dart';
import '../../blocs/main/main_bloc.dart';
import '../../utils/components/components.dart';
import '../../utils/components/password_field.dart';
import '../../utils/confirmation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  var isPasswordVisible = true;
  var confirmPasswordController = TextEditingController();
  var isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Image.asset('assets/icon_register.png', width: 120, height: 120),
              const Spacer(),
              textField(hintText: "Email", fieldController: emailController),
              const SizedBox(height: 20),
              PasswordField(controller: passwordController),
              const SizedBox(height: 20),
              PasswordField(controller: confirmPasswordController, hintText: 'Confirm password'),
              const Spacer(),
              button(
                context: context,
                text: "Register",
                onPressed: onRegisterPressed,
              ),
              const SizedBox(height: 10),
              RichText(
                // how to control here in text span on click text "sing up here"
                // A:
                text: TextSpan(
                  text: "Do you have an account? ",
                  style: TextStyle(color: Colors.grey.shade500),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      text: "Log in",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onRegisterPressed() async {
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      SnackBarService.showFlushBar(context: context, message: 'Password and confirm password must be the same');
      return;
    }

    final isConfirmed = Confirmation.confirmationWithSnackbar(emailController, passwordController, context);
    if (!isConfirmed) return;

    final isRegistered = await RepositoryV3().register(
      email: emailController.text,
      password: passwordController.text,
      name: userNameController.text,
      imagePath: 'https://cdnn21.img.ria.ru/images/07e8/05/05/1943933300_0:79:1081:687_600x0_80_0_0_a6254893f5cf7149ca4f89dcab93dbcf.jpg.webp',
    );

    if (!isRegistered && mounted) {
      SnackBarService.replaceSnackBar(context, 'Register failed please try again');
    } else if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (builder) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MainBloc()),
              BlocProvider(create: (context) => DeleteBloc()),
            ],
            child: const MainScreen(),
          ),
        ),
      );
    }
  }
}
