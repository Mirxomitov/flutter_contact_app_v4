import 'dart:async';

import 'package:contacts_bloc/blocs/login/login_bloc.dart';
import 'package:contacts_bloc/domain/repository_v3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../blocs/delete/delete_bloc.dart';
import '../../blocs/main/main_bloc.dart';
import '../../data/model/enum_navigation.dart';
import '../login/login_screen.dart';
import '../main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => navigateToNextScreen(),
    );
  }

  void navigateToNextScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {

          return BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          );

          /*switch (RepositoryV3().firstScreen()) {
            case NavigationEnum.login:
              return BlocProvider(
                create: (context) => LoginBloc(),
                child: LoginScreen(),
              );
            case NavigationEnum.main:
              return MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => DeleteBloc()),
                  BlocProvider(create: (context) => MainBloc()),
                ],
                child: const MainScreen(),
              );
          }*/
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/icon_splash.png',
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: LoadingAnimationWidget.hexagonDots(
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
