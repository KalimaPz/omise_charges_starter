import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:omise_playground/config/omise.dart';

class ActionOmise {
  static createToken() async {
    String url = "${OmiseConfig.api_vault}/tokens";

    Map body = {
      'card[name]': 'Somchai Prasert',
      'card[number]': '4242424242424242',
      'card[expiration_month]': '10',
      'card[expiration_year]': '2022',
      'card[city]': 'Bangkok',
      'card[postal_code]': '10320',
      'card[security_code]': '123'
    };
    final String basicAuth =
        'Basic ' + base64Encode(utf8.encode(OmiseConfig.publicKey));

    try {
      final res = await http.post(
        Uri.parse(url),
        headers: {"Authorization": "$basicAuth"},
        body: body,
      );
      print(res.body);
    } catch (e) {
      return false;
    }
  }
}
