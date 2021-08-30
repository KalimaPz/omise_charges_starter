import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:omise_playground/local_db/CardAccessObject.dart';
import 'package:omise_playground/local_db/DatabaseSetup.dart';
import 'package:omise_playground/model/OwnCard.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditCardAdd extends StatefulWidget {
  CreditCardAdd({Key key}) : super(key: key);

  @override
  _CreditCardAddState createState() => _CreditCardAddState();
}

class _CreditCardAddState extends State<CreditCardAdd> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController ownerNameController =
      TextEditingController(text: "Donnukrit Satirakul");
  TextEditingController cardNumberController =
      TextEditingController(text: "5577557129258910");
  TextEditingController expireMonthController =
      TextEditingController(text: "10");
  TextEditingController expireYearController =
      TextEditingController(text: "23");
  TextEditingController cvcController = TextEditingController(text: "771");

  SharedPreferences prefs;
  initialAction() async {
    prefs = await SharedPreferences.getInstance();

    print("${prefs.getString("cards")}");
  }

  @override
  void initState() {
    initialAction();
    
    super.initState();
  }

  void addNewCard() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Credit Card"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    controller: ownerNameController,
                    decoration: InputDecoration(hintText: "Card Owner"),
                    validator: (value) {
                      if (ownerNameController.text.isNotEmpty) {
                        return null;
                      } else
                        return "Please Enter Name";
                    },
                  ),
                  TextFormField(
                    controller: cardNumberController,
                    decoration: InputDecoration(hintText: "Card Number"),
                    validator: (value) {
                      if (cardNumberController.text.isNotEmpty) {
                        return null;
                      } else
                        return "Please Enter Card Number";
                    },
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: TextFormField(
                          maxLength: 2,
                          controller: expireMonthController,
                          decoration: InputDecoration(hintText: "Card Owner"),
                          validator: (value) {
                            if (expireMonthController.text.isNotEmpty) {
                              return null;
                            } else
                              return "Please Enter Expire Month";
                          },
                        ),
                      ),
                      Center(child: Text("/")),
                      SizedBox(
                        width: 20,
                        child: TextFormField(
                          maxLength: 2,
                          controller: expireYearController,
                          decoration: InputDecoration(hintText: "Card Owner"),
                          validator: (value) {
                            if (expireYearController.text.isNotEmpty) {
                              return null;
                            } else
                              return "Please Enter Expire Year";
                          },
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    maxLength: 3,
                    controller: cvcController,
                    decoration: InputDecoration(hintText: "Card CVC"),
                    validator: (value) {
                      if (cvcController.text.isNotEmpty) {
                        return null;
                      } else
                        return "Please Enter Name";
                    },
                  ),
                ],
              ),
            ),
          )),
          ElevatedButton(
              onPressed: () async {
                // cardCollection.addNewCard();
                // final res = await StudentDao().insertStudent(Student(name: "donnukrit",rollNo: 1));
                final res = await CardAccessObject().insertOwnedCard(OwnCard(
                    cardCvc: "771",
                    cardExpireMm: "10",
                    cardExpireYy: "23",
                    cardNumber: "5577557129258910",
                    isDefault: false));
                print(res);
              },
              child: Text("Add Card")),
          ElevatedButton(
              onPressed: () async {
                // cardCollection.getAllCard()();
                // final res = await StudentDao().getAllStudents();
                final res = await CardAccessObject().getAllCards();
                print(res.toSet());
              },
              child: Text("Get All")),
          GestureDetector(
            onTap: () {
              addNewCard();
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Add Card",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      letterSpacing: 0.35,
                      fontWeight: FontWeight.bold,
                    ))),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
