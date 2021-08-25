import 'package:flutter/material.dart';
import 'package:omise_playground/actions/ActionOmise.dart';
import 'package:omise_playground/components/MyCard.dart';

class MainHomePage extends StatefulWidget {
  static final String routeName = "/home";
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Home"),
      ),
      body: ElevatedButton(child: Text("TEST"),onPressed: (){
        ActionOmise.createToken();
      },),
    );
  }
}
