

import 'dart:convert';

Customer customerFromJson(String str) {
  final jsonData = json.decode(str);
  return Customer.fromJson(jsonData);
}

String customerToJson(Customer data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Customer {
  String object;
  String id;
  bool livemode;
  String location;
  bool deleted;
  Metadata metadata;
  Cards cards;
  String defaultCard;
  String description;
  String email;
  String createdAt;

  Customer({
    this.object,
    this.id,
    this.livemode,
    this.location,
    this.deleted,
    this.metadata,
    this.cards,
    this.defaultCard,
    this.description,
    this.email,
    this.createdAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => new Customer(
    object: json["object"],
    id: json["id"],
    livemode: json["livemode"],
    location: json["location"],
    deleted: json["deleted"],
    metadata: Metadata.fromJson(json["metadata"]),
    cards: Cards.fromJson(json["cards"]),
    defaultCard: json["default_card"],
    description: json["description"],
    email: json["email"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "id": id,
    "livemode": livemode,
    "location": location,
    "deleted": deleted,
    "metadata": metadata.toJson(),
    "cards": cards.toJson(),
    "default_card": defaultCard,
    "description": description,
    "email": email,
    "created_at": createdAt,
  };
}

class Cards {
  String object;
  List<Datum> data;
  int limit;
  int offset;
  int total;
  String location;
  String order;
  String from;
  String to;

  Cards({
    this.object,
    this.data,
    this.limit,
    this.offset,
    this.total,
    this.location,
    this.order,
    this.from,
    this.to,
  });

  factory Cards.fromJson(Map<String, dynamic> json) => new Cards(
    object: json["object"],
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    limit: json["limit"],
    offset: json["offset"],
    total: json["total"],
    location: json["location"],
    order: json["order"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "object": object,
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    "limit": limit,
    "offset": offset,
    "total": total,
    "location": location,
    "order": order,
    "from": from,
    "to": to,
  };
}

class Datum {
  String object;
  String id;
  bool livemode;
  String location;
  bool deleted;
  String street1;
  dynamic street2;
  String city;
  dynamic state;
  String phoneNumber;
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
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

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => new Metadata(
  );

  Map<String, dynamic> toJson() => {
  };
}
