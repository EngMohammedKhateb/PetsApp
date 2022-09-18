import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

const String baseUrl = "http://192.168.109.141:8000/api/v1";
const String imageUrl = "http://192.168.109.141:8000/";

const bool appDebug = true;

headers() => {
      'Accept': 'application/json',
    };
authedHeaders(String token) =>
    {'Accept': 'application/json', 'Authorization': "Bearer $token"};

httpDebuger(Response response) {
  if (appDebug) {
    /* print(
        "http : ${response.statusCode} => ${response.request!.method} ${response.request!.url} \n ${response.body}");*/
    if (kDebugMode) {
      print(
          "\n http : ${response.statusCode} => ${response.request!.method} ${response.request!.url} \n");
    }
  }
}

// Errors
const invalidResponse = 100;
const noInternet = 101;
const invalidFormat = 102;
const unKnownError = 103;
const unAuthorized = 401;

//cities

const cities = [
  "محافظة اللاذقية",
  "محافظة طرطوس",
  "محافظة حماة",
  "محافظة حمص",
  "محافظة حلب",
  "محافظة دمشق",
  "محافظة ريف دمشق",
  "محافظة السويداء",
  "محافظة القنيطرة",
  "محافظة الحسكة",
  "محافظة دير الزور",
  "محافظة درعا",
  "محافظة الرقة",
  "محافظة إدلب"
];

// works
const works = [
  'طالب هندسة اتصالات',
  'طالب هندسة معلوماتية',
  'طالب في كلية الهمك',
  'مهندس برمجيات',
  'طالب جامعة',
  'طالب مدرسة',
  'مهندس',
  'مبرمج',
  'غير محدد'
];
