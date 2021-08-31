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
  int cardId;
  String ownerName;
  String cardNumber;
  String cardCvc;
  String cardExpireMm;
  String cardExpireYy;
  bool isDefault;

  OwnCard({
    this.cardId,
    this.ownerName,
    this.cardNumber,
    this.cardCvc,
    this.cardExpireMm,
    this.cardExpireYy,
    this.isDefault,
  });

  factory OwnCard.fromJson(Map<String, dynamic> json) => new OwnCard(
        cardId: json["card_id"],
        ownerName: json["owner_name"],
        cardNumber: json["card_number"],
        cardCvc: json["card_cvc"],
        cardExpireMm: json["card_expire_mm"],
        cardExpireYy: json["card_expire_yy"],
        isDefault: json["isDefault"],
      );

  Map<String, dynamic> toJson({int id}) => {
        "card_id": id,
        "owner_name" : ownerName,
        "card_number": cardNumber,
        "card_cvc": cardCvc,
        "card_expire_mm": cardExpireMm,
        "card_expire_yy": cardExpireYy,
        "isDefault": isDefault,
      };
}
