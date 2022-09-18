import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../helpers/toast_helper.dart';
import '../models/account.dart';
import '../repositories/account_repo.dart';
import '../repositories/api_status.dart';

class AccountViewModel extends ChangeNotifier {
  // declare varisables
  bool _loading = true;
  bool _updateLoading = false;
  Account? _account;
  Failure? _errorModel;

  final TextEditingController bioController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String _selectedCity = "اختر المحافظة";
  String _selectedWork = "اختر عملك";
  String _selectedGender = "الجنس";
  List genders = ['ذكر', 'أنثى'];

  //getters
  bool get loading => _loading;
  bool get updateLoading => _updateLoading;

  Failure? get errorModel => _errorModel;
  String? get selectedCity => _selectedCity;
  Account? get account => _account;
  String? get selectWork => _selectedWork;
  String? get selectedGender => _selectedGender;
  //setters

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUpdateLoading(bool loading) async {
    _updateLoading = loading;
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

  setSelectedGender(String gender) async {
    _selectedGender = gender;
    notifyListeners();
  }

  setProfileModel(Account account) {
    _account = account;
  }

  setError(Failure errorModel) {
    _errorModel = errorModel;
  }
  // api calls

  getAccountInfo() async {
    var response = await AccountRepo.getCurrentUserInfo();
    if (response is Success) {
      _account = Account.fromJson(jsonDecode(response.data));

      setControllerData();
    }
    if (response is Failure) {
      _errorModel = response;
    }
    setLoading(false);
  }

  updateAccountInfo(BuildContext context) async {
    String name = nameController.text;
    String birthday = dateController.text;
    String city = _selectedCity;
    String gender = _selectedGender;
    String bio = bioController.text;
    String work = _selectedWork;

    if (gender == "الجنس") {
      Helper().showErrorToast("يجب تحديد الجنس أولا");
      return;
    }
    if (gender == "اختر عملك") {
      Helper().showErrorToast("يجب اختيار العمل");
      return;
    }
    if (_selectedCity == "اختر المحافظة") {
      Helper().showErrorToast("يجب اختيار المحافظة");
      return;
    }
    setUpdateLoading(true);
    var response = await AccountRepo.updateCurrentUserInfo(
        name, birthday, city, gender, bio, work);
    if (response is Success) {
      var body = jsonDecode(response.data);

      _account = Account.fromJson(body);
      setControllerData();
      Helper().showSuccessToast("تم تحديث معلوماتك بنجاح");
    }
    if (response is Failure) {
      Helper().showErrorToast(response.errorResponse);
    }
    setUpdateLoading(false);
  }

  void setControllerData() {
    nameController.text = _account!.name;
    bioController.text = _account!.bio;
    dateController.text = _account!.birthdate;
    _selectedCity = _account!.city;
    _selectedWork = _account!.work;

    _selectedGender = _account!.gender == 0 ? "ذكر" : "أنثى";
  }
}
