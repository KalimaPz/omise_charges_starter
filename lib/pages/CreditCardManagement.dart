import 'package:flutter/material.dart';
import 'package:omise_playground/pages/CreditCardAdd.dart';
import 'package:omise_playground/pages/CreditCardDetail.dart';

class CreditCardManagement extends StatefulWidget {
  CreditCardManagement({Key key}) : super(key: key);

  @override
  _CreditCardManagementState createState() => _CreditCardManagementState();
}

class _CreditCardManagementState extends State<CreditCardManagement> {
  GestureDetector creditCardTile(
      {@required String cardType, bool isDefault = false}) {
    String imageUrl = "";
    switch (cardType) {
      case "1":
        imageUrl = "assets/icon/amex.png";
        break;
      case "2":
        imageUrl = "assets/icon/mastercard.png";
        break;
      case "3":
        imageUrl = "assets/icon/visa.png";
        break;
      case "4":
        imageUrl = "assets/icon/discover.png";
        break;
      default:
        imageUrl = "assets/icon/notfound.png";
        break;
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreditCardDetail(),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 5),
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              width: 36,
              child: Image(
                image: AssetImage(imageUrl),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("9999"),
                  Text(isDefault ? "Default" : ""),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: Text("Payment Method"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                creditCardTile(cardType: "1", isDefault: true),
                creditCardTile(cardType: "2"),
                creditCardTile(cardType: "3"),
                creditCardTile(cardType: "4"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditCardAdd(),
                  ));
            },
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: Text(
                  "Add Credit Card",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                    letterSpacing: 0.35,
                  ),
                )),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
