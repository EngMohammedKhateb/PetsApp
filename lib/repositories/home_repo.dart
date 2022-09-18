import 'dart:convert';
import 'dart:io';

import '../helpers/constants.dart';
import '../helpers/store_helper.dart';
import 'package:http/http.dart' as http;

import 'api_status.dart';

class HomeRepo {
  static Future<Object> getHomeData() async {
    try {
      var url = Uri.parse("$baseUrl/home");

      String token = await StoreHelper().getAccessToken();
      // ignore: avoid_print
      print('token is : $token');
      var response = await http.get(url, headers: authedHeaders(token));

      httpDebuger(response);

      if (200 == response.statusCode) {
        return Success(data: response.body, code: 200);
      }
      if (403 == response.statusCode) {
        return Failure(
            code: invalidResponse,
            errorResponse: jsonDecode(response.body)['message'].toString());
      }
      if (401 == response.statusCode) {
        return Failure(
            code: unAuthorized, errorResponse: "unAuthorizated Request");
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
