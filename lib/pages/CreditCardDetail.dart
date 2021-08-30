import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CreditCardDetail extends StatelessWidget {
  const CreditCardDetail({Key key}) : super(key: key);

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
        // physics: NeverScrollableScrollPhysics(),
        children: [
          CreditCardWidget(
            cardBgColor: Color(0xffffff),
            cardNumber: "5577 5571 2925 8910",
            expiryDate: "10/23",
            cardHolderName: "Donnukrit Satirakul.",
            cvvCode: "771",
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
                  value: true,
                  onChanged: (value) {
                    return 0;
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
                
                Icon(Icons.info,color: Colors.grey.withOpacity(0.45),),
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                      "หมายเหตุ : ทดสอบ ทดสอบ ทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบทดสอบ"),
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              // color: Colors.blue,
              color: Colors.white,
              child: InkWell(
                onTap: () {},
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
