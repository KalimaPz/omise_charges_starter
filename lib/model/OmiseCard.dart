

import 'dart:convert';

OmiseCard omiseCardFromJson(String str) {
  final jsonData = json.decode(str);
  return OmiseCard.fromJson(jsonData);
}

String omiseCardToJson(OmiseCard data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class OmiseCard {
  String name;
  String number;
  String expirationMonth;
  String expirationYear;
  String city;
  String postalCode;
  String securityCode;

  OmiseCard({
    this.name,
    this.number,
    this.expirationMonth,
    this.expirationYear,
    this.city,
    this.postalCode,
    this.securityCode,
  });

  factory OmiseCard.fromJson(Map<String, dynamic> json) => new OmiseCard(
    name: json["name"],
    number: json["number"],
    expirationMonth: json["expiration_month"],
    expirationYear: json["expiration_year"],
    city: json["city"],
    postalCode: json["postal_code"],
    securityCode: json["security_code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
    "expiration_month": expirationMonth,
    "expiration_year": expirationYear,
    "city": city,
    "postal_code": postalCode,
    "security_code": securityCode,
  };
}
