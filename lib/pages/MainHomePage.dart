import 'package:flutter/material.dart';
import 'package:omise_playground/actions/ActionOmise.dart';
import 'package:omise_playground/model/OmiseCard.dart';

class MainHomePage extends StatefulWidget {
  static final String routeName = "/home";
  MainHomePage({Key key}) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireMonthController = TextEditingController();
  TextEditingController expireYearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();

  String token = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Home"),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Card Owner"
                    ),
                    controller: nameController,
                    validator: (value) {
                      if (nameController.text == null ||
                          nameController.text == "") {
                        return "enter name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                     decoration: InputDecoration(
                      hintText: "Card Number"
                    ),
                    controller: cardNumberController,
                    validator: (value) {
                      if (cardNumberController.text == null ||
                          cardNumberController.text == "") {
                        return "enter number";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                     decoration: InputDecoration(
                      hintText: "Expire Month"
                    ),
                    controller: expireMonthController,
                    validator: (value) {
                      if (expireMonthController.text == null ||
                          expireMonthController.text == "") {
                        return "enter exp month";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                     decoration: InputDecoration(
                      hintText: "Expire Year"
                    ),
                    controller: expireYearController,
                    validator: (value) {
                      if (expireYearController.text == null ||
                          expireYearController.text == "") {
                        return "enter exp year";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                     decoration: InputDecoration(
                      hintText: "Card CVC"
                    ),
                    controller: cvcController,
                    validator: (value) {
                      if (cvcController.text == null ||
                          cvcController.text == "") {
                        return "enter cvc";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  print(_formKey.currentState.validate());
                  final res = await ActionOmise.createToken(
                      card: OmiseCard(
                          name: nameController.text.trim(),
                          city: "phuket",
                          expirationMonth: expireMonthController.text.trim(),
                          number: cardNumberController.text.trim(),
                          expirationYear: expireYearController.text.trim(),
                          postalCode: "30102",
                          securityCode: cvcController.text.trim()));
                  print(res.id);
                  setState(() {
                    token = res.id;
                  });
                  final chargeResponse  = await ActionOmise.charge(
                    amount: 10000,
                    token: res.id,
                  );

                  print("charge response ${chargeResponse}");
                  
                }
              },
              child: Text('Submit')),
          Text("Current Token : $token"),
          ElevatedButton(onPressed: () async {
                    ActionOmise.createCustomer(email: "kalima007c@gmail.com");

                  }, child: Text("Create Customer"))
          
        ],
      ),
    );
  }
}
