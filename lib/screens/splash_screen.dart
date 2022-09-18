import '../helpers/hex_helpers.dart';
import '../utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    sleepAndNavigate(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              HexColor("#e3e3e3"),
              HexColor("#e3e3e3"),
              Colors.white,
              Colors.white,
              Colors.white,
              HexColor("#e3e3e3"),
            ],
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/topsan.png',
                  width: 100,
                )),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/bottom.png',
                  width: 100,
                )),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 -
                  MediaQuery.of(context).size.height / 8.5,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logocolored.png',
                    width: 100,
                  ),
                  Text(
                    "BETA ACADEMY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.2, 1.2),
                              blurRadius: 3),
                        ],
                        fontSize: 30,
                        color: HexColor("#3eb4f4"),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "أكاديمية بيتا التعليمية",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.2, 1.2),
                              blurRadius: 3),
                        ],
                        fontSize: 22,
                        color: const Color.fromARGB(255, 94, 94, 94),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/beta.png',
                      width: 20,
                    ),
                    Text(" FROM BETACODE",
                        style: TextStyle(
                            fontSize: 13, color: HexColor("#00c3d8"))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void sleepAndNavigate(BuildContext context) async {
    var isLogin = await SessionManager().get('is_login') ?? false;
    await Future.delayed(const Duration(seconds: 4)).then(
      (value) => isLogin ? goToHome(context) : goToLogin(context),
    );
  }
}
