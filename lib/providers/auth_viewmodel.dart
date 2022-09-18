import 'dart:convert';

import '../errors/error.dart';
import '../helpers/encriptiion.dart';
import '../repositories/api_status.dart';
import '../utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../helpers/toast_helper.dart';
import '../models/auth_model.dart';
import '../repositories/auth_repo.dart';

class AuthViewModel extends ChangeNotifier {
  // declare variables
  bool _loading = false;
  AuthModel? _authModel;
  ErrorModel? _errorModel;

  // login controllers
  final TextEditingController _phonec = TextEditingController();
  final TextEditingController _passwordc = TextEditingController();

  //register controllers
  final TextEditingController regPhonec = TextEditingController();
  final TextEditingController regPasswordc = TextEditingController();
  final TextEditingController regNamec = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String _selectedCity = "اختر المحافظة";
  String _selectedWork = "اختر عملك";
  var cities = [];
  bool _regLoading = false;

  //getters
  bool get loading => _loading;
  bool get regLoading => _regLoading;
  AuthModel? get authModel => _authModel;
  ErrorModel? get errorModel => _errorModel;
  String? get selectedCity => _selectedCity;
  String? get selectWork => _selectedWork;
  TextEditingController get phonec => _phonec;
  TextEditingController get passwordc => _passwordc;

  //setters

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setRegLoading(bool loading) async {
    _regLoading = loading;
    notifyListeners();
  }

  setSelectedCity(String city) async {
    _selectedCity = city;
    notifyListeners();
  }

  setSelectedWork(String work) async {
    _selectedWork = work;
    notifyListeners();
  }

  setAuthModel(AuthModel authModel) {
    _authModel = authModel;
    notifyListeners();
  }

  setError(ErrorModel errorModel) {
    _errorModel = errorModel;
    notifyListeners();
  }

  //calls

  login(context) async {
    setLoading(true);
    var response = await AuthServices.login(phonec.text, passwordc.text);
    if (response is Success) {
      setAuthModel(AuthModel.fromJson(jsonDecode(response.data)));
      Helper().showSuccessToast("تم تسجيل الدخول");
      await SessionManager().set("is_login", true);
      await SessionManager()
          .set("auth_model", Encriptor().toBase64(response.data.toString()));
      goToHome(context);
    }
    if (response is Failure) {
      ErrorModel errorModel = ErrorModel(
          code: response.code, message: response.errorResponse.toString());
      setError(errorModel);
      Helper().showErrorToast(response.errorResponse.toString());
    }
    setLoading(false);
  }

  getAuthResponse() async {}
}
