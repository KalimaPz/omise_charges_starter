import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omise_playground/pages/CreditCardManagement.dart';
import 'package:omise_playground/pages/MainHomePage.dart';



void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
 theme: ThemeData(fontFamily: GoogleFonts.kanit().fontFamily),
      routes: {
        MainHomePage.routeName : (context) => MainHomePage()
      },
      home: CreditCardManagement(),
    );
  }
}