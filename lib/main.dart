import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itau_redesign/screens/splash/spalsh.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco Itaú - Redesign',
      home: SplashScreen(),
    );
  }
}
