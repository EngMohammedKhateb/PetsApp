import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../helpers/constants.dart';
import '../providers/auth_viewmodel.dart';
import '../themes/theme_service.dart';

class CompleteRegister extends StatefulWidget {
  const CompleteRegister({Key? key}) : super(key: key);

  @override
  State<CompleteRegister> createState() => _CompleteRegisterState();
}

class _CompleteRegisterState extends State<CompleteRegister> {
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            splashRadius: 20,
                            splashColor: primaryColor,
                            tooltip: 'go back',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      ),
                      const SizedBox(
                        height: 27,
                      ),
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
                                "استكمال التسجيل",
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: !ThemeService().isDarkModeActive()
                              ? const Color(0xFF252525)
                              : Colors.grey[200],
                        ),
                        padding: const EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButton(
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              iconDisabledColor: blueColor,
                              iconEnabledColor: blueColor,
                              hint: Text(authViewModel.selectedCity.toString()),
                              items: cities
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.toString(),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.right,
                                          )),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (e) {
                                authViewModel.setSelectedCity(e.toString());
                              }),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: !ThemeService().isDarkModeActive()
                              ? const Color(0xFF252525)
                              : Colors.grey[200],
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButton(
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              isExpanded: true,
                              icon: const Icon(Icons.arrow_drop_down_circle),
                              iconDisabledColor: blueColor,
                              iconEnabledColor: blueColor,
                              hint: Text(authViewModel.selectWork.toString()),
                              items: works
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e.toString(),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.right,
                                          )),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (e) {
                                authViewModel.setSelectedWork(e.toString());
                              }),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: !ThemeService().isDarkModeActive()
                              ? const Color(0xFF252525)
                              : Colors.grey[200],
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            readOnly: true,
                            controller: authViewModel.dateController,
                            decoration: InputDecoration(
                              labelText: 'تاريخ الميلاد',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5)),
                              suffixIcon: const Icon(
                                Icons.date_range,
                                color: blueColor,
                              ),
                            ),
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2015),
                                lastDate: DateTime(2025),
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  authViewModel.dateController.text =
                                      selectedDate.toString().substring(0, 10);
                                }
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء اختيار تاريخ الميلاد';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      !authViewModel.regLoading
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
                                      //   authViewModel.register();
                                    },
                                    icon: const Icon(Icons.login, size: 18),
                                    label: const Text(
                                      "إنشاء حساب",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: const Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            ),
                      const SizedBox(
                        height: 15,
                      ),
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
