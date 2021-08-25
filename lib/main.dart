import 'package:flutter/material.dart';
import 'package:omise_playground/pages/MainHomePage.dart';

import 'pages/HomePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        MainHomePage.routeName : (context) => MainHomePage()
      },
      home: MainHomePage(),
    );
  }
}