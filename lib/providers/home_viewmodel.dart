import '../helpers/store_helper.dart';
import '../models/home_model.dart';
import '../repositories/api_status.dart';
import '../repositories/home_repo.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class HomeViewModel extends ChangeNotifier {
  //bottom navigation controller
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // declare variables
  bool _loading = false;
  HomeModel? _homeModel;
  String? _error;
  int? _statusCode;
  //constructor

  //getters

  bool get loading => _loading;
  HomeModel? get homeModel => _homeModel;
  int? get statusCode => _statusCode;
  String? get error => _error;
  int get currentIndex => _currentIndex;
  PageController get pageController => _pageController;

  // setters

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setHomeModel(HomeModel homeModel) {
    _homeModel = homeModel;
    notifyListeners();
  }

  // setters
  getHomeModel(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    _error = null;
    _statusCode = null;

    var response = await HomeRepo.getHomeData();
    if (response is Success) {
      _loading = true;
      //   setHomeModel(HomeModel.fromJson(jsonDecode(response.data)));
    }
    if (response is Failure) {
      _error = response.errorResponse;
      _statusCode = response.code;
      setLoading(false);
      if (_statusCode == 401) {
        StoreHelper().clearStorage();
        // ignore: use_build_context_synchronously
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            ModalRoute.withName("/Home"));
        return;
      }
    }
  }
}
