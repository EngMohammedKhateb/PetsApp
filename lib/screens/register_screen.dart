import '../helpers/colors.dart';
import '../screens/complete_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_viewmodel.dart';
import '../themes/theme_service.dart';
import '../widgets/grey_input.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = context.watch<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
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
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logocolored.png',
                                width: 80,
                                height: 80,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              const Text(
                                "أكاديمية بيتا التعليمية",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: blueColor,
                                  fontFamily: 'vexaone',
                                ),
                              ),
                              Text(
                                "إنشاء حساب جديد",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: !ThemeService().isDarkModeActive()
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 115, 115, 115),
                                    fontFamily: 'Cairo',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                      const SizedBox(height: 25),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GreyInput(
                            controller: authViewModel.regNamec,
                            minLine: 1,
                            maxLine: 1,
                            icon: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            hint: 'أدخل اسم المستخدم'),
                      ),
                      const SizedBox(height: 15),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GreyInput(
                            controller: authViewModel.regPhonec,
                            minLine: 1,
                            maxLine: 1,
                            icon: const Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            hint: 'أدخل رقم الهاتف'),
                      ),
                      const SizedBox(height: 15),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: GreyInput(
                            controller: authViewModel.regPasswordc,
                            minLine: 1,
                            maxLine: 1,
                            secure: true,
                            icon: const Icon(
                              Icons.lock,
                              color: Color.fromARGB(255, 112, 112, 112),
                            ),
                            hint: 'أدخل كلمة المرور'),
                      ),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 35,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ElevatedButton.icon(
                              style:
                                  ElevatedButton.styleFrom(primary: blueColor),
                              onPressed: () {
                                // Respond to button press
                                //   authViewModel.register();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const CompleteRegister()));
                              },
                              icon: const Icon(Icons.login, size: 23),
                              label: const Text(
                                "متابعة",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            "! تسجيل الدخول",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 112, 112, 112),
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
