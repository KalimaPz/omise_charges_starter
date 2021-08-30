import 'dart:convert';

OmiseResponse omiseResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return OmiseResponse.fromJson(jsonData);
}

String omiseResponseToJson(OmiseResponse data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class OmiseResponse {
  String object;
  String id;

  String location;
  bool used;
  String chargeStatus;
  Card card;
  String createdAt;

  OmiseResponse({
    this.object,
    this.id,
    this.location,
    this.used,
    this.chargeStatus,
    this.card,
    this.createdAt,
  });

  factory OmiseResponse.fromJson(Map<String, dynamic> json) =>
      new OmiseResponse(
        object: json["object"],
        id: json["id"],
        location: json["location"],
        used: json["used"],
        chargeStatus: json["charge_status"],
        card: Card.fromJson(json["card"]),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "location": location,
        "used": used,
        "charge_status": chargeStatus,
        "card": card.toJson(),
        "created_at": createdAt,
      };
}

class Card {
  String object;
  String id;
  bool livemode;
  dynamic location;
  bool deleted;
  dynamic street1;
  dynamic street2;
  String city;
  dynamic state;
  dynamic phoneNumber;
  String postalCode;
  String country;
  String financing;
  String bank;
  String brand;
  String fingerprint;
  dynamic firstDigits;
  String lastDigits;
  String name;
  int expirationMonth;
  int expirationYear;
  bool securityCodeCheck;
  String createdAt;

  Card({
    this.object,
    this.id,
    this.livemode,
    this.location,
    this.deleted,
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.phoneNumber,
    this.postalCode,
    this.country,
    this.financing,
    this.bank,
    this.brand,
    this.fingerprint,
    this.firstDigits,
    this.lastDigits,
    this.name,
    this.expirationMonth,
    this.expirationYear,
    this.securityCodeCheck,
    this.createdAt,
  });

  factory Card.fromJson(Map<String, dynamic> json) => new Card(
        object: json["object"],
        id: json["id"],
        livemode: json["livemode"],
        location: json["location"],
        deleted: json["deleted"],
        street1: json["street1"],
        street2: json["street2"],
        city: json["city"],
        state: json["state"],
        phoneNumber: json["phone_number"],
        postalCode: json["postal_code"],
        country: json["country"],
        financing: json["financing"],
        bank: json["bank"],
        brand: json["brand"],
        fingerprint: json["fingerprint"],
        firstDigits: json["first_digits"],
        lastDigits: json["last_digits"],
        name: json["name"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        securityCodeCheck: json["security_code_check"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "id": id,
        "livemode": livemode,
        "location": location,
        "deleted": deleted,
        "street1": street1,
        "street2": street2,
        "city": city,
        "state": state,
        "phone_number": phoneNumber,
        "postal_code": postalCode,
        "country": country,
        "financing": financing,
        "bank": bank,
        "brand": brand,
        "fingerprint": fingerprint,
        "first_digits": firstDigits,
        "last_digits": lastDigits,
        "name": name,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "security_code_check": securityCodeCheck,
        "created_at": createdAt,
      };
}
