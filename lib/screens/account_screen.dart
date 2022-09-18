import '../helpers/colors.dart';
import '../helpers/hex_helpers.dart';
import '../providers/account_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../themes/theme_service.dart';
import '../widgets/grey_input.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AccountViewModel>(context, listen: false).getAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
    AccountViewModel accountViewModel = context.watch<AccountViewModel>();

    return Scaffold(body: buildUi(accountViewModel));
  }

  buildUi(AccountViewModel accountViewModel) {
    if (accountViewModel.loading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    if (accountViewModel.errorModel != null) {
      return Center(
        child: Text(accountViewModel.errorModel!.errorResponse.toString()),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    splashRadius: 20,
                    splashColor: primaryColor,
                    tooltip: 'back to home',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: HexColor("#ffeeeeee"),
                    radius: 120,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl + accountViewModel.account!.image,
                      placeholder: (context, url) => const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amber[600]),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                        splashRadius: 20,
                        splashColor: primaryColor,
                        tooltip: 'back to home',
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              accountViewModel.account!.name,
              style: TextStyle(
                  fontSize: 18,
                  color: !ThemeService().isDarkModeActive()
                      ? Colors.white
                      : const Color(0xFF252525),
                  fontWeight: FontWeight.bold),
            ),
            Text(accountViewModel.account!.phone),
            const SizedBox(
              height: 17,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "تعديل معلومات ملفك الشخصي",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "اسم المستخدم",
                textAlign: TextAlign.start,
              ),
            ),
            GreyInput(
                controller: accountViewModel.nameController,
                hint: "اسم المستخدم"),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "المحافظة",
                textAlign: TextAlign.start,
              ),
            ),
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
                    underline: DropdownButtonHideUnderline(child: Container()),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    iconDisabledColor: primaryColor,
                    iconEnabledColor: secondaryColor,
                    hint: Text(accountViewModel.selectedCity.toString()),
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
                      accountViewModel.setSelectedCity(e.toString());
                    }),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "العمل",
                textAlign: TextAlign.start,
              ),
            ),
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
                    underline: DropdownButtonHideUnderline(child: Container()),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    iconDisabledColor: primaryColor,
                    iconEnabledColor: secondaryColor,
                    hint: Text(accountViewModel.selectWork.toString()),
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
                      accountViewModel.setSelectedWork(e.toString());
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الجنس",
                textAlign: TextAlign.start,
              ),
            ),
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
                    underline: DropdownButtonHideUnderline(child: Container()),
                    isExpanded: true,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    iconDisabledColor: primaryColor,
                    iconEnabledColor: secondaryColor,
                    hint: Text(accountViewModel.selectedGender.toString()),
                    items: accountViewModel.genders
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
                      accountViewModel.setSelectedGender(e.toString());
                    }),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الميلاد",
                textAlign: TextAlign.start,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                readOnly: true,
                controller: accountViewModel.dateController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: !ThemeService().isDarkModeActive()
                      ? const Color(0xFF252525)
                      : Colors.grey[200],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                  hintText: "اختر ميلادك",
                  suffixIcon: const Icon(
                    Icons.date_range,
                    color: Colors.black,
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
                      accountViewModel.dateController.text =
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
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الحالة",
                textAlign: TextAlign.start,
              ),
            ),
            GreyInput(
                controller: accountViewModel.bioController,
                minLine: 3,
                maxLine: 5,
                hint:
                    "اكتب بعض العبارات التي تصف اعمالك ومهاراتك وأشياء تحب القيام بها"),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: accountViewModel.updateLoading
                  ? const CupertinoActivityIndicator()
                  : SizedBox(
                      height: 40,
                      child: ElevatedButton.icon(
                          onPressed: () {
                            accountViewModel.updateAccountInfo(context);
                          },
                          icon: const Icon(Icons.save),
                          label: const Text("حفظ التعديلات")),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
