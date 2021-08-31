import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:omise_playground/local_db/CardAccessObject.dart';
import 'package:omise_playground/model/OwnCard.dart';

class CreditCardDetail extends StatefulWidget {
  final OwnCard card;

  const CreditCardDetail({
    Key key,
    this.card,
  }) : super(key: key);

  @override
  _CreditCardDetailState createState() => _CreditCardDetailState();
}

class _CreditCardDetailState extends State<CreditCardDetail> {
  bool isDefaultCard = false;
  @override
  void initState() {
    isDefaultCard = widget.card.isDefault;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Card Detail",
          style: TextStyle(color: Colors.black87),
        ),
        leading: IconButton(
          color: Colors.black87,
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          CreditCardWidget(
            cardBgColor: Color(0xffffff),
            cardNumber: widget.card.cardNumber,
            expiryDate: "${widget.card.cardExpireMm}/${widget.card.cardExpireYy}",
            cardHolderName: "${widget.card.ownerName}",
            cvvCode: widget.card.cardCvc,
            textStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 0.35,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
            showBackView: false, //true when you want to show cvv(back) view
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(child: Text('Set as Default')),
                CupertinoSwitch(
                  value: isDefaultCard,
                  onChanged: (value) {
                    setState(() {
                      // print(widget.card.cardId);
                       isDefaultCard = !isDefaultCard;
                       
                    });
                    CardAccessObject().setDefaultCard(widget.card,isDefaultCard);
                  },
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: Colors.grey.withOpacity(0.45),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                      "${widget.card.cardId} หมายเหตุ : ทดสอบ ทดสอบ ทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบ"),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.white,
              child: InkWell(
                onTap: () async {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text(
                          "Delete",
                        ),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                              child: Text("Delete"),
                              onPressed: () async {
                                await CardAccessObject().delete(widget.card);
                                int count = 0;

                                Navigator.popUntil(context, (route) {
                                  return count++ == 2;
                                });
                              })
                        ],
                      );
                    },
                  );
                },
                splashColor: Colors.black12,
                highlightColor: Colors.white,
                child: Text("Delete",
                    style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              )),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
