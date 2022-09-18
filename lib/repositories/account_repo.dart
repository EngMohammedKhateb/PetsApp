import 'dart:convert';
import 'dart:io';

import '../helpers/constants.dart';
import 'package:http/http.dart' as http;

import '../helpers/store_helper.dart';
import 'api_status.dart';

class AccountRepo {
  static Future<Object> getCurrentUserInfo() async {
    try {
      var url = Uri.parse("$baseUrl/users/info");

      String token = await StoreHelper().getAccessToken();

      var response = await http.get(url, headers: authedHeaders(token));
      httpDebuger(response);

      if (200 == response.statusCode) {
        return Success(data: response.body, code: 200);
      }

      if (unAuthorized == response.statusCode) {
        return Failure(
            code: invalidResponse, errorResponse: 'unauthorized | 401');
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

  static Future<Object> updateCurrentUserInfo(String name, String birthday,
      String city, String gender, String bio, String work) async {
    try {
      var url = Uri.parse("$baseUrl/users/update");
      var data = {
        "name": name,
        "birthday": birthday,
        "city": city,
        "gender": gender,
        "bio": bio,
        "work": work
      };
      final encoding = Encoding.getByName('utf-8');
      String token = await StoreHelper().getAccessToken();
      print('sending => ${url.toString()}');
      var response = await http.post(url,
          headers: authedHeaders(token), body: data, encoding: encoding);

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
}
