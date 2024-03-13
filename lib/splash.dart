// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_managements/helpers/user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 5), () => checkUserPreference());
  }

  checkUserPreference() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(userProvider.keyLogin);

    if (isLoggedIn != null) {
      if (isLoggedIn) {
        context.goNamed('user-info',
            pathParameters: {'userEmail': userProvider.email});
      } else {
        context.goNamed('login');
      }
    } else {
      context.goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app layer link
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: const [],
            ),
          ],
        ),
      ),
    );
  }
}
