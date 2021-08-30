import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:omise_playground/config/omise.dart';
import 'package:omise_playground/model/Customer.dart';
import 'package:omise_playground/model/OmiseCard.dart';
import 'package:omise_playground/model/OmiseResponse.dart';

class ActionOmise {
  static createCustomer({String email}) async {
    String url = "https://api.omise.co/customers";
    Map body = {
      'description': '',
      'email': 'somchai.prasert@example.com'
    };
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode(OmiseConfig.secretKey));
    try {
      final res = await http.post(Uri.parse(url), body: body, headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      if(res.statusCode == 200) {
        return Customer.fromJson(jsonDecode(res.body));
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static createToken({OmiseCard card}) async {
    String url = "${OmiseConfig.api_vault}/tokens";

    Map body = {
      'card[name]': card.name,
      'card[number]': card.number,
      'card[expiration_month]': card.expirationMonth,
      'card[expiration_year]': card.expirationYear,
      'card[city]': card.city,
      'card[postal_code]': card.postalCode,
      'card[security_code]': card.securityCode
    };
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode(OmiseConfig.publicKey));

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "$basicAuth"},
        body: body,
      );

      if (res.statusCode == 200) {
        print(res.statusCode);
        return Customer.fromJson(jsonDecode(res.body));
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static charge({int amount, String token}) async {
    String url = "https://api.omise.co/charges";
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode(OmiseConfig.secretKey));
    print(basicAuth);
    final Map body = {'amount': '$amount', 'currency': 'thb', 'card': '$token'};

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "$basicAuth"},
        body: body,
      );
      print(res.statusCode);
      if (res.statusCode == 200) {
        return res.body;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
