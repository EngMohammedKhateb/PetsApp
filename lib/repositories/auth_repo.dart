import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../helpers/constants.dart';
import '../repositories/api_status.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<Object> login(String phone, String password) async {
    try {
      var url = Uri.parse("$baseUrl/login");
      var data = {"phone": phone, "password": password};
      final encoding = Encoding.getByName('utf-8');

      if (kDebugMode) {
        print('sending => ${url.toString()}');
      }
      var response = await http.post(url,
          headers: headers(), body: data, encoding: encoding);

      httpDebuger(response);

      if (200 == response.statusCode) {
        return Success(data: response.body, code: 200);
      }
      if (403 == response.statusCode) {
        return Failure(
            code: invalidResponse,
            errorResponse: jsonDecode(response.body)['message'].toString());
      }
      return Failure(code: invalidResponse, errorResponse: 'invalid response');
    } on HttpException {
      return Failure(code: noInternet, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(code: noInternet, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: 'Invalid Response');
    } catch (e) {
      return Failure(code: unKnownError, errorResponse: 'Unknown Error');
    }
  }

  static Future<Object> register(String name, String phone, String password,
      String work, String birthdate, String city, String deviceId) async {
    try {
      var url = Uri.parse("$baseUrl/register");
      var response = await http.get(url);
      if (200 == response.statusCode) {
        return Success(data: response.body, code: 200);
      }
      return Failure(code: invalidResponse, errorResponse: 'invalid response');
    } on HttpException {
      return Failure(code: noInternet, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: invalidFormat, errorResponse: 'Invalid Response');
    } catch (e) {
      return Failure(code: unKnownError, errorResponse: 'Unknown Exception');
    }
  }
}
