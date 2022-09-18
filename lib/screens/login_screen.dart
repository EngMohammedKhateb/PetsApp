import '../helpers/colors.dart';
import '../providers/auth_viewmodel.dart';
import '../utils/navigation.dart';
import '../widgets/grey_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logocolored.png',
                        width: 100,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "BETA ACADEMY",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: blueColor,
                          fontFamily: "bauhs",
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "أكاديمية بيتا التعليمية",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: !ThemeService().isDarkModeActive()
                              ? Colors.white
                              : const Color.fromARGB(255, 115, 115, 115),
                          fontSize: 22,
                          fontFamily: "vexaone",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "تسجيل الدخول",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: !ThemeService().isDarkModeActive()
                                    ? const Color.fromARGB(255, 213, 213, 213)
                                    : const Color.fromARGB(255, 48, 48, 48),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(height: 10),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GreyInput(
                            controller: authViewModel.phonec,
                            minLine: 1,
                            maxLine: 1,
                            icon: const Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            hint: 'أدخل رقم الهاتف'),
                      ),
                      const SizedBox(height: 10),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GreyInput(
                            controller: authViewModel.passwordc,
                            minLine: 1,
                            maxLine: 1,
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            hint: 'أدخل كلمة المرور'),
                      ),
                      const SizedBox(height: 30),
                      !authViewModel.loading
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 40,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        primary: blueColor),
                                    onPressed: () {
                                      // Respond to button press
                                      authViewModel.login(context);
                                    },
                                    icon: const Icon(Icons.login, size: 23),
                                    label: const Text(
                                      "تسجيل الدخول",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Align(
                              alignment: Alignment.centerLeft,
                              child: Center(
                                child: SizedBox(
                                  height: 40,
                                  child: CupertinoActivityIndicator(),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Respond to button press
                            goToRegister(context);
                          },
                          child: const Text(
                            "! إنشاء حساب جديد",
                            style: TextStyle(
                                color: Color.fromARGB(255, 112, 112, 112),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
