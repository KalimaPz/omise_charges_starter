
import 'dart:convert';

OwnCard ownCardFromJson(String str) {
  final jsonData = json.decode(str);
  return OwnCard.fromJson(jsonData);
}

String ownCardToJson(OwnCard data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class OwnCard {
  String cardNumber;
  String cardCvc;
  String cardExpireMm;
  String cardExpireYy;
  bool isDefault;

  OwnCard({
    this.cardNumber,
    this.cardCvc,
    this.cardExpireMm,
    this.cardExpireYy,
    this.isDefault,
  });

  factory OwnCard.fromJson(Map<String, dynamic> json) => new OwnCard(
    cardNumber: json["card_number"],
    cardCvc: json["card_cvc"],
    cardExpireMm: json["card_expire_mm"],
    cardExpireYy: json["card_expire_yy"],
    isDefault: json["isDefault"],
  );

  Map<String, dynamic> toJson() => {
    "card_number": cardNumber,
    "card_cvc": cardCvc,
    "card_expire_mm": cardExpireMm,
    "card_expire_yy": cardExpireYy,
    "isDefault": isDefault,
  };
}
