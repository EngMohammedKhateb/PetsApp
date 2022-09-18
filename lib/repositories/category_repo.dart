import 'dart:convert';
import 'dart:io';

import '../helpers/constants.dart';
import '../helpers/store_helper.dart';
import '../repositories/api_status.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<Object> getCategories() async {
    try {
      var url = Uri.parse("$baseUrl/categories");

      final encoding = Encoding.getByName('utf-8');
      String token = StoreHelper().getAccessToken.toString();

      var response = await http.post(url,
          headers: authedHeaders(token), encoding: encoding);

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
