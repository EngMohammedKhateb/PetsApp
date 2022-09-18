import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../models/auth_model.dart';
import 'encriptiion.dart';

class StoreHelper {
  Future<String> getAccessToken() async {
    String base64 = await SessionManager().get('auth_model');

    AuthModel authModel = AuthModel.fromJson(
        jsonDecode(Encriptor().fromBase64(base64).toString()));

    // print(Encriptor().fromBase64(base64));
    // print("\n \n${authModel.user!.name}");
    return authModel.accessToken.toString();
  }

  getUser() async {
    String base64 = await SessionManager().get('auth_model');

    AuthModel authModel = AuthModel.fromJson(
        jsonDecode(Encriptor().fromBase64(base64).toString()));

    // print(Encriptor().fromBase64(base64));
    // print("\n \n${authModel.user!.name}");
    return authModel.user;
  }

  getAuthModel() async {
    String base64 = await SessionManager().get('auth_model');

    AuthModel authModel = AuthModel.fromJson(
        jsonDecode(Encriptor().fromBase64(base64).toString()));

    // print(Encriptor().fromBase64(base64));
    // print("\n \n${authModel.user!.name}");
    return authModel;
  }

  clearStorage() async {
    await SessionManager().destroy();
  }
}
