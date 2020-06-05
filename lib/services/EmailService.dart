import 'dart:convert';

import 'package:mailsendermodile/models/Email.dart';
import 'package:http/http.dart' as http;

class EmailService {
  Future<http.Response> sendMail(Email email) {
    return http.post("https://emailbroker.herokuapp.com/email",
        headers:  {"Content-type": "application/json"},
        body: json.encode(email.toJson()));
  }
}
