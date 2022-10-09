import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itau_redesign/screens/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAnimated = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isAnimated = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 4,
            colors: const [
              Color(0XFFFF9700),
              Color(0XFFFF7B00),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 4),
              width: isAnimated ? 300 : 30,
              curve: Curves.easeIn,
              onEnd: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => LoginPage(),
                  ),
                );
              },
              child: Image.asset(
                "assets/images/logo1.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
