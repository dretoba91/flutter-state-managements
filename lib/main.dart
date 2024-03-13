import 'package:flutter/material.dart';
import 'package:flutter_state_managements/helpers/routes.dart';
import 'package:flutter_state_managements/helpers/user_provider.dart';
// import 'package:flutter_state_managements/value_notifier/counter_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: RouteHelpers.routes,
    );
  }
}


