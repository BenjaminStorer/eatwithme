//Adapted from https://github.com/bizz84/coding-with-flutter-login-demo/blob/master/lib/main.dart

import 'package:eatwithme/pages/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:eatwithme/theme/eatwithme_theme.dart';
import 'package:eatwithme/utils/constants.dart';
import 'package:eatwithme/pages/intro/splash_screen.dart';
import 'package:eatwithme/pages/intro/intro_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    "/intro": (BuildContext context) => IntroScreen(),
    "/root": (BuildContext context) => RootPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: FirebaseAuth.instance.onAuthStateChanged),
      ],
      child: MaterialApp(
        title: APP_TITLE,
        theme: themeLight(),
        routes: routes,
        home: SplashScreen(),
      ),
    );
  }
}
