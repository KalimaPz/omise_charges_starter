import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:omise_playground/local_db/CardAccessObject.dart';
import 'package:omise_playground/model/OwnCard.dart';
import 'package:omise_playground/pages/CreditCardAdd.dart';
import 'package:omise_playground/pages/CreditCardDetail.dart';

class CreditCardManagement extends StatefulWidget {
  CreditCardManagement({Key key}) : super(key: key);

  @override
  _CreditCardManagementState createState() => _CreditCardManagementState();
}

class _CreditCardManagementState extends State<CreditCardManagement> {
  List<OwnCard> ownedCardList = [];
  GestureDetector creditCardTile({@required OwnCard card}) {
    String imageUrl = "";
    CreditCardType cardType = detectCCType(card.cardNumber);
    print(cardType.toString());
    switch (cardType) {
      case CreditCardType.amex:
        imageUrl = "assets/icon/amex.png";
        break;
      case CreditCardType.mastercard:
        imageUrl = "assets/icon/mastercard.png";
        break;
      case CreditCardType.visa:
        imageUrl = "assets/icon/visa.png";
        break;
      case CreditCardType.discover:
        imageUrl = "assets/icon/discover.png";
        break;
      default:
        imageUrl = "assets/icon/unknown.png";
        break;
    }
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreditCardDetail(
                card: card,
              ),
            ));

        initialAction();
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
                  Text(card.cardNumber.substring(
                      card.cardNumber.length - 4, card.cardNumber.length)),
                  Text(card.isDefault ? "Default" : ""),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  initialAction() async {
    final res = await CardAccessObject().getAllCards();
    print(res.runtimeType);
    setState(() {
      ownedCardList = res;
    });
  }

  @override
  void initState() {
    super.initState();
    initialAction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Payment Method", style: TextStyle(color: Colors.black)),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ownedCardList.length != 0
              ? Expanded(
                  child: ListView.builder(
                    itemCount: ownedCardList.length,
                    itemBuilder: (context, index) {
                      return creditCardTile(card: ownedCardList[index]);
                    },
                  ),
                )
              : Expanded(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 64,
                        image: AssetImage("assets/icon/credit-card.png"),
                      ),
                      SizedBox(height: 20),
                      Text("Card Not Added")
                    ],
                  )),
                ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreditCardAdd(),
                  ));
              initialAction();
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
